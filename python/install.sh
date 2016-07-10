# Install global packages
PIP_REQUIRE_VIRTUALENV=false /usr/local/bin/pip install --upgrade distribute virtualenv pip

# Set up pipsi

# Check for Pipsi (https://github.com/mitsuhiko/pipsi)
if test ! $(which pipsi)
then
  echo "  Installing Pipsi."
  curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
  ~/.local/venvs/pipsi/bin/pip install -U https://github.com/mitsuhiko/pipsi/archive/master.zip
else
  echo "  Upgrading Pipsi."
  pipsi upgrade pipsi
fi

# Install Apps
for app in ipython aldryn-client pep8 devpi-client
do
  ~/.local/bin/pipsi install $app
done

# Lancet with Python 3
pipsi install --python=$(which python3) lancet
