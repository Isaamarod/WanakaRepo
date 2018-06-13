#! /bin/bash
#origine rute
rutaori=procesadas_sin_train/*

#destination route
rutadest=todo_sin_train_2

#make a new dir for to enter the archives (line 9 is optional if you want, enter another directory that just exist)
mkdir todo_sin_train_2

#for each directory in origine rute
for directorio in "$rutaori"
do
#open each folder

rutaorifolder=$directorio/*

#for each archive in each folder in each directory 

for archivos in "$rutaorifolder"
do

#copy the archives in  destination route

cp $archivos $rutadest

#for each copied archive in destination route 
for archivos_copiados in "$rutadest"
do

# enter in destination route and put the name of each archive
cd  "${rutadest}"
ls>../etiquetas_sin_train.txt
done
done
done
