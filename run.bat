@echo off
setlocal

set "ENVIRONMENT=hf"
set "PYTHON_VERSION=3.13.5"

REM Se inicializa Conda
call conda init cmd.exe

REM Verificar si el environment ya existe
FOR /F "tokens=*" %%i IN ('conda env list ^| findstr /R "^ *%ENVIRONMENT% " ') DO (
    echo El environment '%ENVIRONMENT%' ya existe.
    goto activate_env
)

REM Crear el environment si no existe
echo Creando el environment '%ENVIRONMENT%' con Python %PYTHON_VERSION%...
conda create --force -y -n %ENVIRONMENT% python=%PYTHON_VERSION%
if errorlevel 1 (
    echo Error al crear el environment.
    exit /b 1
)

:activate_env
REM Activar el environment y continuar
call conda activate %ENVIRONMENT%

REM Instalar dependencias
python -m pip install -r requirements.txt

REM Iniciar Jupyter Notebook
jupyter notebook

endlocal
