import flet as ft

def LoginView(page, auth_controller):
    email_input = ft.TextField(label="Correo Institucional", width=300)
    pass_input = ft.TextField(label="Contraseña", password=True, can_reveal_password=True, width=300)

    def login_click(e):
        if not email_input.value or not pass_input.value:
            page.snack_bar = ft.SnackBar(ft.Text("Ingresa correo y contraseña."))
            page.snack_bar.open = True
            page.update()
            return

        user, msg = auth_controller.login(email_input.value, pass_input.value)
        if user:
            page.current_user = user
            page.go("/menu")
        else:
            page.snack_bar = ft.SnackBar(ft.Text(msg))
            page.snack_bar.open = True
            page.update()

    def go_register(e):
        page.go("/register")

    return ft.View(
        route="/login",
        vertical_alignment=ft.MainAxisAlignment.CENTER,
        horizontal_alignment=ft.CrossAxisAlignment.CENTER,
        controls=[
            ft.Icon(ft.Icons.SCHOOL, size=100, color="blue"),
            ft.Text("Guías CETIS 61", size=30, weight="bold"),
            email_input,
            pass_input,
            ft.ElevatedButton("Entrar", on_click=login_click, width=300, bgcolor="blue", color="white"),
            ft.TextButton("Registrarse", on_click=go_register, width=300)
        ]
    )