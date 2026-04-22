import flet as ft

def main(page: ft.Page):
    page.title = "Bears Project - Titulación"
    page.theme_mode = ft.ThemeMode.DARK # O Dark, tú eliges
    
    # Aquí es donde definiremos los cambios de pantalla
    def route_change(route):
        page.views.clear()
        page.views.append(
            ft.View(
                "/",
                [
                    ft.AppBar(title=ft.Text("Inicio"), bgcolor=ft.Colors.ON_SURFACE_VARIANT),
                    ft.Text("Bienvenido a Bears", size=30),
                    ft.ElevatedButton("Ir a Configuración", on_click=lambda _: page.go("/settings")),
                ],
            )
        )
        if page.route == "/settings":
            page.views.append(
                ft.View(
                    "/settings",
                    [
                        ft.AppBar(title=ft.Text("Configuración"), bgcolor=ft.Colors.ON_SURFACE_VARIANT),
                        ft.Text("Aquí puedes ajustar todo"),
                        ft.ElevatedButton("Volver", on_click=lambda _: page.go("/")),
                    ],
                )
            )
        page.update()

    page.on_route_change = route_change
    page.go(page.route)

ft.app(target=main)