export ENVIRONMENT="hf"
export PYTHON_VERSION="3.13.5"

if conda env list | grep -qE "^\s*${ENVIRONMENT}\s"; then
    echo "El environment '$ENVIRONMENT' ya existe."
else
    # se crea el environment para trabajar
    conda create --force -y -n $ENVIRONMENT python=$PYTHON_VERSION
    echo "El environment '$ENVIRONMENT' ha sido creado."
fi

# se activa el environment previamente creado
conda activate $ENVIRONMENT

# se instalan las librerías correspondientes
python -m pip install -r requirements.txt

# se inicia jupyter notebook
jupyter notebook
