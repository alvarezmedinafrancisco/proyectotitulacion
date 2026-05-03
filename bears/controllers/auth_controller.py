from ..models.user_model import UsuarioModel
from ..models.schemas_model import UsuarioSchema
from pydantic import ValidationError

class AuthController:
    def __init__(self):
        self.model = UsuarioModel()
        
    def login(self, email, password):
        # llama al modelo para verificar credenciales en la DB
        user = self.model.obtener_por_email(email)
        if not user:
            return None, "Correo no registrado."

        if self.model.validar_contrasena(password, user["password"]):
            return user, "¡Bienvenido de nuevo!"
        return None, "Contraseña incorrecta."
        
    def registrar_usuario(self, nombre, email, password):
        try:
            #registro 
            nuevo_usuario = UsuarioSchema(nombre=nombre, email=email, password=password)

            # verificamos que no etcista el correo antes de registrar
            if self.model.obtener_por_email(nuevo_usuario.email):
                return False, "Este correo ya está registrado."

            # ci pasa la validación, lo mandamos al modelo para guardarlo en la DB
            success = self.model.registrar(
                nuevo_usuario.nombre,
                nuevo_usuario.email,
                nuevo_usuario.password
            )
            if success:
                return True, "Registro completado con éxito."
            return False, "No se pudo registrar. Intenta de nuevo más tarde."
        except ValidationError as e:
            # validacion de errores dependiendo de lo que falle en el schema
            return False, f"Datos inválidos: {e.errors()[0]['msg']}"
