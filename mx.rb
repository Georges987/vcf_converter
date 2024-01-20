# Ouvrir le fichier txt en mode lecture
txt_file = File.open("input.txt", "r")

# Créer un fichier vcf en mode écriture
vcf_file = File.open("output.vcf", "w")

# Parcourir chaque ligne du fichier txt
txt_file.each_line do |line|
  # Ignorer les lignes vides
  next if line.strip.empty?

  # Séparer les données par des tabulations
  data = line.split("\t")

  # Extraire le nom et le numéro de téléphone
  name = data[0]
  phone = data[1]

  # Écrire les données dans le format vcf
  vcf_file.write("BEGIN:VCARD\n")
  vcf_file.write("VERSION:3.0\n")
  vcf_file.write("N:#{name};;;\n")
  vcf_file.write("FN:#{name}\n")
  vcf_file.write("TEL;TYPE=CELL:#{phone}\n")
  vcf_file.write("END:VCARD\n")
end

# Fermer les fichiers
txt_file.close
vcf_file.close

