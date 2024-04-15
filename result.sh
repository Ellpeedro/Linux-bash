#!/bin/bash
#ajouter notes
ajouter_notes() {
read -p "Le nom de la module: " module
read -p "Entrer la note de cette module: " note
if [ ! -f "stocknotes.txt" ]; then
touch stocknotes.txt
fi
echo "$module:$note" >> stocknotes.txt
echo "Note added successfully"
}

#Afficher les notes
afficher_notes() {
if [ -f "stocknotes.txt" ]; then
cat stocknotes.txt
else
echo "No notes available"
fi
}
#Modify notes
modifie_notes(){
read -p "Veiullez saisi la  module de la note modifie: " module
if grep -q "^$module:" stocknotes.txt;then
read -p "Entrer la nouvelle note de cette module" new_note
sed -i "s/^$module:.*/$module:$new_note/" stocknotes.txt
echo "Note modify successfully"
else
echo "La module n'exist pas"
fi
}
#suppression notes
supp_notes(){
read -p "Veuillez saisi le module de la note a suppremer: " module
if grep -q "^$module:" stocknotes.txt
then
sed -i "/^$module:/d" stocknotes.txt
echo "La note supprimer succes"
else
echo "La module  n'exist pas"
fi
}
#boucle principal de la programme
while true;do
echo "Bienvenue dans la gestion des notes"
echo "1-Ajouter une nouvelle notes"
echo "2-Afficher les notes"
echo "3-Modifie les notes"
echo "4-Suppression les notes"
echo "5-exit"
read -p "Choisissez une option: " choix
case $choix in
1)ajouter_notes;;
2)afficher_notes;;
3)modifie_notes;;
4)supp_notes;;
5)exit;;
*)echo "Error";;
esac
done
