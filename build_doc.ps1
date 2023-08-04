# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
# install https://tug.org/texlive/windows.html#install

python -m venv .venv
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force 
.\.venv/Scripts/Activate.ps1  -Prompt "venv"
python.exe -m pip install --upgrade pip
pip install -r requirements_melted.txt
echo "# generated with 'pip freeze' to make sure github action doesent update env when no update - hint from https://github.com/actions/setup-python" > requirements.txt

pip freeze >> requirements.txt

.\make.bat html

deactivate
# end
