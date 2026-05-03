import flet as ft
from .controllers.auth_controller import AuthController
from .controllers.examen_controller import ExamenController
from .views.login_view import LoginView
from .views.register_view import RegisterView
from .views.menu_view import MenuView
from .views.examen_view import ExamenView

def main(page: ft.Page):
    page.title = "Sistema de Guías - CETIS 61"
    page.window_width = 450
    page.window_height = 800
    page.theme_mode = ft.ThemeMode.LIGHT
    
    try:
        auth_ctrl = AuthController()
        exam_ctrl = ExamenController()
        print("Controladores listos.")
    except Exception as e:
        print(f"Error en BD: {e}")

    def route_change(e):
        page.views.clear()
        
        if page.route == "/" or page.route == "/login" or page.route == "":
            page.views.append(LoginView(page, auth_ctrl))
        elif page.route == "/register":
            page.views.append(RegisterView(page, auth_ctrl))
        elif page.route == "/menu":
            if not getattr(page, "current_user", None):
                page.route = "/login"
                page.update()
                return
            page.views.append(MenuView(page, exam_ctrl))
        elif page.route.startswith("/examen/"):
            try:
                id_unidad = int(page.route.split("/")[-1])
                page.views.append(ExamenView(page, exam_ctrl, id_unidad))
            except:
                page.route = "/menu"
                page.update()
        
        page.update()

    page.on_route_change = route_change
    # Forzamos el primer renderizado de forma segura
    route_change(None)

def run():
    ft.run(main)

if __name__ == "__main__":
    run()