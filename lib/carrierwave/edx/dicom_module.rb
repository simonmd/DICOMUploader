require 'dicom'
require 'mini_magick'
include DICOM
module Edx
    module CarrierWave
        module Dicom
            module ClassMethods
                def summary
                  process :dicomdata
                end
                
                def dcm2jpg
                  process :dcm2jpg
                end
            end

            def dicomdata
              dcmobj = DObject.new(path)
              return dcmobj
            end
            
            def dcm2jpg
              # Path al ejecutable dcm2jpg
              dcm2jpgpath = File.join(Dir.pwd, "lib", "dcm4che-2.0.25", "bin", "dcm2jpg")
              dicompath = path
              thumbpath = File.join(Dir.pwd, "public", store_path + ".jpg")
              #corre el ejecutable de dcm4che2 con las opciones
              puts `#{dcm2jpgpath} #{path} #{thumbpath}`
              # Generacion del thumbnail, se que esto deberia ir en un procesador separado 
              image = MiniMagick::Image.open(thumbpath)
              image.resize "150x150"
              file = image.write thumbpath
            end
        end
    end
end