# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
# install https://tug.org/texlive/windows.html#install

param (
    # do html, default on
    [Parameter(Mandatory=$false)]
    [int]$html_on = 1,
    
    # do pdf, default on
    [int]$pdf_on = 1
)

python -m venv .venv
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force 
.\.venv/Scripts/Activate.ps1  -Prompt "venv"
python.exe -m pip install --upgrade pip
pip install -r requirements_melted.txt
Write-Host "# generated with 'pip freeze' to make sure github action doesent update env when no update - hint from https://github.com/actions/setup-python" > requirements.txt

pip freeze --local >> requirements.txt

if ($html_on -eq 1) {
    Write-Host "HTML build is on."
    .\make.bat html
}
else {
    Write-Host ("HTML build is off.")
}
if ($pdf_on -eq 1) {
    Write-Host "PDF build is on."
    .\make.bat latexpdf
}
else {
    Write-Host ("PDF build is off.")
}

deactivate
