import jwt
import datetime
from flask import Blueprint, request, jsonify, current_app
from database import init_db
from werkzeug.security import generate_password_hash, check_password_hash
import mysql.connector

app = Blueprint('api', __name__)

SECRET_KEY = 'apisecret'

# Inicializa la conexión a la base de datos
db_connection = None

def get_db_connection():
    global db_connection
    if db_connection is None:
        db_connection = init_db(current_app) 
    return db_connection

# Rutas para el modelo AI
@app.route('/modelos', methods=['POST'])
def create_modelo():
    data = request.json
    cursor = get_db_connection().cursor()
    cursor.execute('''INSERT INTO ModeloAI (version, contenido, fecha_entrenamiento, rol) 
                      VALUES (%s, %s, %s, %s)''', 
                   (data['version'], data['contenido'], data['fecha_entrenamiento'], data['rol']))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Modelo creado"}), 201

@app.route('/modelos', methods=['GET'])
def get_modelos():
    cursor = get_db_connection().cursor()
    cursor.execute('SELECT * FROM ModeloAI ORDER BY fecha_modificacion DESC')
    modelos = cursor.fetchall()
    cursor.close()
    return jsonify(modelos), 200

@app.route('/modelos/<int:id>', methods=['PUT'])
def update_modelo(id):
    data = request.json
    cursor = get_db_connection().cursor()
    cursor.execute('''UPDATE ModeloAI SET version=%s, contenido=%s, fecha_entrenamiento=%s, rol=%s 
                      WHERE id_modelo=%s''', 
                   (data['version'], data['contenido'], data['fecha_entrenamiento'], data['rol'], id))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Modelo actualizado"}), 200

@app.route('/modelos/<int:id>', methods=['DELETE'])
def delete_modelo(id):
    cursor = get_db_connection().cursor()
    cursor.execute('DELETE FROM ModeloAI WHERE id_modelo=%s', (id,))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Modelo eliminado"}), 204

# Rutas para el usuario
@app.route('/usuarios', methods=['POST'])
def create_usuario():
    data = request.json
    correo = data['correo']
    hashed_password = data['contrasenia']
    
    conn = get_db_connection()
    cursor = conn.cursor()

    # Verifica si el correo ya existe
    cursor.execute('SELECT * FROM usuario WHERE correo = %s', (correo,))
    existing_user = cursor.fetchone()

    if existing_user:
        # Si el correo ya existe, devuelve un error
        cursor.close()
        return jsonify({"error": "El correo ya está registrado"}), 409  # 409 Conflict

    # Si no existe, procede con la creación del usuario
    cursor.execute('''INSERT INTO usuario (nombre, apellido, correo, contrasenia, rol) 
                      VALUES (%s, %s, %s, %s, %s)''', 
                   (data['nombre'], data['apellido'], data['correo'], hashed_password, data['rol']))
    conn.commit()
    cursor.close()

    return jsonify({"message": "Usuario creado"}), 201


@app.route('/usuarios', methods=['GET'])
def get_usuarios():
    cursor = get_db_connection().cursor(dictionary=True)
    cursor.execute('SELECT * FROM usuario ORDER BY fecha_modificacion DESC')
    usuarios = cursor.fetchall()
    cursor.close()
    return jsonify(usuarios), 200

@app.route('/usuarios/<int:id>', methods=['PUT'])
def update_usuario(id):
    data = request.json
    cursor = get_db_connection().cursor()
    cursor.execute('''UPDATE usuario SET nombre=%s, apellido=%s, correo=%s, rol=%s, imagen=%s  
                      WHERE id_usuario=%s''', 
                   (data['nombre'], data['apellido'], data['correo'], data['rol'], data['imagen'], id))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Usuario actualizado"}), 200

@app.route('/usuarios/<int:id>', methods=['DELETE'])
def delete_usuario(id):
    cursor = get_db_connection().cursor()
    cursor.execute('DELETE FROM usuario WHERE id_usuario=%s', (id,))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Usuario eliminado"}), 204

# Función para generar un token JWT
def generate_token(usuario_id):
    token = jwt.encode({
        'id_usuario': usuario_id,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=1)  # Token expira en 1 hora
    }, SECRET_KEY, algorithm='HS256')
    return token

# Ruta de login
@app.route('/login', methods=['POST'])
def login():
    data = request.json
    cursor = get_db_connection().cursor()
    cursor.execute('SELECT * FROM usuario WHERE correo=%s', (data['correo'],))
    usuario = cursor.fetchone()
    
    if usuario and (usuario[4] == data['contrasenia']):  # Compara contraseñas
        token = generate_token(usuario[0]) 
        return jsonify({"token": token, "id": usuario[0], "nombre": usuario[1], "apellido": usuario[2], "correo": usuario[3], "rol": usuario[5], "imagen": usuario[6]}), 200
    return jsonify({"message": "Credenciales inválidas"}), 401

# Esto permite asegurar las rutas que requieren autenticación
@app.route('/protected', methods=['GET'])
def protected():
    token = request.headers.get('Authorization').split(" ")[1]  # Se espera el formato 'Bearer <token>'    
    try:
        data = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
        return jsonify({"message": "Token válido", "id_usuario": data['id_usuario']}), 200
    except jwt.ExpiredSignatureError:
        return jsonify({"message": "Token expirado"}), 401
    except jwt.InvalidTokenError:
        return jsonify({"message": "Token inválido"}), 401

# Rutas para la traducción
@app.route('/traducciones', methods=['POST'])
def create_traduccion():
    data = request.json
    cursor = get_db_connection().cursor()
    cursor.execute('''INSERT INTO Traduccion (texto_traducido, gesto_capturado, fecha, `precision`, id_usuario, id_modelo) 
                      VALUES (%s, %s, %s, %s, %s, %s)''', 
                   (data['texto_traducido'], data['gesto_capturado'], data['fecha'], data['precision'], data['id_usuario'], data['id_modelo']))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Traducción creada"}), 201

# Obtiene las traducciones
@app.route('/traducciones', methods=['GET'])
def get_traducciones():
    id_usuario = request.args.get('id_usuario')
    cursor = get_db_connection().cursor(dictionary=True)

    try:
        if id_usuario:
            query = 'SELECT * FROM Traduccion WHERE id_usuario = %s ORDER BY fecha_modificacion DESC'
            cursor.execute(query, (id_usuario,))
        else:
            cursor.execute('SELECT * FROM Traduccion ORDER BY fecha_modificacion DESC')

        traducciones = cursor.fetchall()
        return jsonify(traducciones), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        cursor.close()

@app.route('/traducciones/<int:id>', methods=['PUT'])
def update_traduccion(id):
    data = request.json
    cursor = get_db_connection().cursor()
    cursor.execute('''UPDATE Traduccion SET texto_traducido=%s, gesto_capturado=%s, fecha=%s, `precision`=%s, id_usuario=%s, id_modelo=%s 
                      WHERE id_traduccion=%s''', 
                   (data['texto_traducido'], data['gesto_capturado'], data['fecha'], data['precision'], data['id_usuario'], data['id_modelo'], id))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Traducción actualizada"}), 200

@app.route('/traducciones/<int:id>', methods=['DELETE'])
def delete_traduccion(id):
    cursor = get_db_connection().cursor()
    cursor.execute('DELETE FROM Traduccion WHERE id_traduccion=%s', (id,))
    get_db_connection().commit()
    cursor.close()
    return jsonify({"message": "Traducción eliminada"}), 204
