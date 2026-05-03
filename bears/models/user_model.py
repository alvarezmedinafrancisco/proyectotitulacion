import bcrypt 
from .database_model import Database

class UsuarioModel:
    def __init__(self):
        self.db = Database()

    def registrar(self, nombre, email, password):
        # encriptamos la contraseña antes de guardarla en la db
        salt = bcrypt.gensalt()
        hashed_pw = bcrypt.hashpw(password.encode('utf-8'), salt)
        
        conn = self.db.get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO usuarios (nombre, email, password) VALUES (%s, %s, %s)",
                (nombre, email, hashed_pw.decode('utf-8'))
            )
            conn.commit()
            return True
        except Exception as e:
            print(f"Error al registrar: {e}")
            return False
        finally:
            conn.close()

    def obtener_por_email(self, email):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM usuarios WHERE email = %s", (email,))
        user = cursor.fetchone()
        conn.close()
        return user

    def validar_contrasena(self, password, hashed_password):
        try:
            return bcrypt.checkpw(password.encode('utf-8'), hashed_password.encode('utf-8'))
        except ValueError as e:
            print(f"Error de hash en DB: {e}")
            return False

    def validar_login(self, email, password):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM usuarios WHERE email = %s", (email,))
        user = cursor.fetchone()
        conn.close()
        
        if user and self.validar_contrasena(password, user['password']):
            return user
        return None