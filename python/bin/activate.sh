envpath='bin/activate'

if [ -f $envpath ]; then
  source $envpath
  return
else
  envpath='env/'$envpath
fi

for i in `seq 1 10`;
  do
    if [ -f $envpath ]; then
      source $envpath
      echo `realpath $envpath`
      break
    else
      envpath='../'$envpath
    fi
  done
