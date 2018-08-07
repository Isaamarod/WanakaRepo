#! /bin/bash
#script para unificar todas las imagenes con y sin gliomas en una misma carpeta
#script para unificar todas las etiquetas ""

ruta_ori=todo_train/

ruta_des=todo_train/sin_mask



#copiar imagenes en ruta_des
for archivo in "$ruta_ori"
do
echo "$(ls $ruta_ori)"
if $archivo != "*mask.jpg";then


cp $archivo $ruta_des
echo "$(ls $ruta_des)"

fi


        





echo "todo va chachi"

done


