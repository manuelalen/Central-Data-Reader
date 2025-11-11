# Central-Data-Reader

## Descripción  
Central-Data-Reader es un proyecto diseñado para orquestar la ingesta, transformación y carga (ETL/ELT) de múltiples fuentes de datos hacia un entorno de producción. Fue creado para centralizar el acceso, procesamiento y monitorización de datos empresariales de forma estructurada y reutilizable.

## Objetivos  
- Extraer datos de diversas bases de datos y archivos CSV/JSON.  
- Aplicar reglas de deduplicación, transformación y negocio (por ejemplo: mantener sólo la última fila por clave).  
- Cargar los datos transformados en un almacén de datos (por ejemplo, Snowflake o similar).  
- Mantener control de versiones y trazabilidad en los pipelines de integración.

## Tecnologías utilizadas  
- Azure Data Factory (ADF) para orquestación.  
- Snowflake como data-warehouse destino.  
- GitHub para control de versiones (repositorio central).  
- Python / SQL para transformaciones (según los scripts).  
- Contenedores / Docker (si aplica) para entornos reproducibles.  

## Estructura del repositorio  
```text
│  
├── /pipelines/                # JSON de pipelines de ADF  
├── /datasets/                 # JSON de datasets de ADF  
├── /linkedServices/           # Conexiones definidas en ADF  
├── /scripts/                  # Scripts auxiliares (Python, SQL)  
├── /docs/                     # Documentación adicional  
└── README.md                  # Este documento  
