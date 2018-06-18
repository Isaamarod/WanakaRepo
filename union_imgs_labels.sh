#! /bin/bash
#script para unificar todas las imagenes con y sin gliomas en una misma carpeta
#script para unificar todas las etiquetas ""




ruta_con=con_glioma/todo_con_train/*  #All images train with glioma
ruta_sin=sin_glioma/todo_sin_train/* #All images whithout glioma
ruta_fin_img=TRAIN/IMG_TRAIN #Train image directory
ruta_etiqueta_con=con_glioma/etiquetas_con_train.txt #All labels whith glioma
ruta_etiqueta_sin=sin_glioma/todo_etiquetas_sin_train.txt #All labels whithout glioma
ruta_etiqueta_union=TRAIN/LABELS_TRAIN/todo_etiquetas_train.txt #Train label directory with .txt union
ruta_etiq_u=TRAIN/LABELS_TRAIN/  #Train label directory


#copy all images with glioma from $ruta_con to $ruta_fin_img
for archivo_con in "$ruta_con"
do

cp $archivo_con $ruta_fin_img
cd $ruta_fin_img

#Count images
echo $(ls|wc -l)

cd ..
cd ..


#copy all images without glioma from $ruta_sin to $ruta_fin_img
for archivo_sin in "$ruta_sin"
do

cp $archivo_sin $ruta_fin_img

cd $ruta_fin_img

#Count images in this point we would have with+without
echo $(ls|wc -l)

cd ..
cd ..

#paste all labels from $ruta_etiqueta_con to $ruta_etiqueta_union
cat $ruta_etiqueta_con > $ruta_etiqueta_union

echo $(pwd)
cd $ruta_etiq_u

#Count lines in the document we would have with
echo $(wc -l todo_etiquetas_train.txt)
cd ..
cd ..

#paste all labels from $ruta_etiqueta_sin to $ruta_etiqueta_union
cat $ruta_etiqueta_sin >> $ruta_etiqueta_union
cd $ruta_etiq_u

#Count lines in the document we would have with+without
echo $(wc -l todo_etiquetas_train.txt)
#ojo, si no coincide el numero total de imagenes con el de etiquetas comprobar si hay etiquetas repe, en ese caso, buscar las imagenes porque al unirlas no copian dos veces las imagenes duplicadas en proc_sin (sin filtro) prox_con (sin filtro)
#if the number of images and labels aren't the same we use this function to find repeat images (when we have two images that are the same, only is copied one but througth labels we can find the images repetead)
sort todo_etiquetas_train.txt | uniq -d
echo "todo va chachi"

done
done
