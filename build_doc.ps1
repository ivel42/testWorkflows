# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

python -m venv .venv
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force 
.\.venv/Scripts/Activate.ps1  -Prompt "venv"
python.exe -m pip install --upgrade pip
pip install -r requirements.txt
echo "generated with 'pip freeze' to make sure github action doesent update env when no update" > requirements_frozen.txt

pip freeze >> requirements_frozen.txt

deactivate
