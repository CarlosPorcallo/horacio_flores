# se crea el environment para trabajar
conda create --force -y -n hf python

# se activa el environment previamente creado
conda activate hf

# se instalan las librerías correspondientes
python -m pip install -r requirements.txt

# se inicia jupyter notebook
jupyter notebook
