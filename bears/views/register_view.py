import flet as ft


def RegisterView(page, auth_controller):
    name_input = ft.TextField(label="Nombre completo", width=300)
    email_input = ft.TextField(label="Correo Institucional", width=300)
    pass_input = ft.TextField(label="Contraseña", password=True, can_reveal_password=True, width=300)
    confirm_input = ft.TextField(label="Confirmar contraseña", password=True, can_reveal_password=True, width=300)

    def register_click(e):
        if not name_input.value or not email_input.value or not pass_input.value or not confirm_input.value:
            page.snack_bar = ft.SnackBar(ft.Text("Completa todos los campos."))
            page.snack_bar.open = True
            page.update()
            return

        if pass_input.value != confirm_input.value:
            page.snack_bar = ft.SnackBar(ft.Text("Las contraseñas no coinciden."))
            page.snack_bar.open = True
            page.update()
            return

        success, msg = auth_controller.registrar_usuario(name_input.value, email_input.value, pass_input.value)
        page.snack_bar = ft.SnackBar(ft.Text(msg))
        page.snack_bar.open = True
        page.update()

        if success:
            page.go("/login")

    def back_to_login(e):
        page.go("/login")

    return ft.View(
        route="/register",
        vertical_alignment=ft.MainAxisAlignment.CENTER,
        horizontal_alignment=ft.CrossAxisAlignment.CENTER,
        controls=[
            ft.Icon(ft.Icons.PERSON_ADD, size=100, color="green"),
            ft.Text("Registro de usuario", size=28, weight="bold"),
            ft.Text("Crea una cuenta para iniciar sesión después", size=14),
            name_input,
            email_input,
            pass_input,
            confirm_input,
            ft.ElevatedButton("Registrarme", on_click=register_click, width=300, bgcolor="green", color="white"),
            ft.TextButton("Volver al login", on_click=back_to_login, width=300)
        ]
    )
