## Estrategia de pruebas avanzadas -UD7

## 1. Objetivo
Evaluar la robustez de la aplicaión bajo uso repetido (estrés),
comprobar seguridad básica (uso HTTPS) y observar el consumo de recursos (CPU/memoria) en las pantallas principales.

## 2. Alcance

Se incluyen las siguientes partes de la app:

- **HOME / Lista de productos**
- **Favoritos** 
- **Informe** 

## 3. Casos de prueba seleccionados

## Caso A - Volumen / estrés

**Descripción:**
Repetir acciones de filtrado + navegación para comprobar que la aplicaión no se bloquea.

1) Iniciar App y hacer login anónimo.
2) Esperar a que carguen los productos.
3) Entrar a ReportScreen.
4) Cambiar el filtro de categoría.
5) Volver atrás y entrar de nuevo.
6) Hacer scroll en la lista.
7) Repetir el ciclo 30 veces.


**Resultado esperado**
- La app no se bloquea.
- No hay pantalla en blanco.
- Los filtros responden correctamente en todas las ocaciones.

## Caso B - Seguridad (HTTPS)

**Descripción:**
Comprobar la API se consume por HTTPS

**Comprobación**
- Confirmar que FakeStore usa "https://fakestoreapi.com"

**Resultados esperados:**
-No se usa HTTP en peticiones.

## Caso C - Uso recursos

**Descripción:**
Observar consumo mientras se usa la pantalla Informe

**Pasos:**

1) Ejecutar la app en modo profile.
2) Usar Home y luego informe.
3) Mantener la pantalla de informe abierta durante 30 segundos.
4) Cambiar de filtro 3 veces.
5) Medir picos con DevTools.

**Resultado esperado**
-La UI sigue fluida sin congelarse.

## Criterios de Aceptación

- No hay cierres inesperados.
- La app mantiene periciones sobre HTTPS.
- La pantalla Informe funciona sin bloquearse.
- Consumo estable.
