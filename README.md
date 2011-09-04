*There's no charge for awesomeness......or attractiveness - Po* (Kung Fu Panda)

DICOM uploader with Sinatra Awesomeness!
========================================

Esta vaina sube un archivo DICOM con **carrierwave** y le extrae la metadata con **RubyDICOM**  

Correr 'ruby dicomwave.rb' despues de instalar los siguientes gems:

'carrierwave', 'sinatra', 'sqlite3', 'sequel', 'carrierwave/sequel', 'awesome\_print' Y 'mini\_magick'

###OJO! Como no hay decoder de JPEG2000 para Mac, las imagenes de prueba tienen que estar descomprimidas o comprimirlas en otro formato.###


PD: Para instalar el ImageMagick en Lion y ruby 1.9, hay que hacer:

brew remove imagemagick
brew --cache imagemagick
brew install -f imagemagick --disable-openmp

o si ya habia quedado mal instalado:

brew upgrade -f imagemagick --disable-openmp

