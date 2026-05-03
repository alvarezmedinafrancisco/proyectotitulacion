import flet as ft

def MenuView(page, examen_controller):
    semestres = examen_controller.listar_semestres()
    
    container_materias = ft.Column(spacing=10)

    def cargar_unidades(id_materia):
        container_materias.controls.clear()
        unidades = examen_controller.listar_unidades(id_materia)
        if unidades:
            for u in unidades:
                container_materias.controls.append(
                    ft.ElevatedButton(
                        content=u['nombre'],
                        width=300,
                        on_click=lambda _, id_u=u['id_unidad']: page.go(f"/examen/{id_u}")
                    )
                )
        else:
            container_materias.controls.append(ft.Text("No hay unidades registradas para esta materia.", size=16))
        page.update()

    def cargar_materias(id_semestre):
        container_materias.controls.clear()
        materias = examen_controller.listar_materias(id_semestre)
        if materias:
            for m in materias:
                container_materias.controls.append(
                    ft.ElevatedButton(
                        content=m['nombre'],
                        width=300,
                        on_click=lambda _, id_m=m['id_materia']: cargar_unidades(id_m)
                    )
                )
        else:
            container_materias.controls.append(ft.Text("No hay materias para este semestre.", size=16))
        page.update()

    # generamos botones de semestre dinámicamente
    botones_semestres = []
    for s in semestres:
        botones_semestres.append(
            ft.TextButton(content=s['nombre'], on_click=lambda _, id_s=s['id_semestre']: cargar_materias(id_s))
        )
    return ft.View(
        route="/menu",
        controls=[
            ft.AppBar(title=ft.Text("Guías CETIS 61"), bgcolor=ft.Colors.BLUE_800, color="white"),
            ft.Text("Selecciona tu semestre:", size=20, weight="bold"),
            ft.Row(botones_semestres, scroll=ft.ScrollMode.ALWAYS),
            ft.Divider(),
            ft.Text("Materias disponibles:", size=18),
            container_materias
        ],
        padding=20
    )