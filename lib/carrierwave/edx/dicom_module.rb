require 'dicom'
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
                
                def dcm2jpg_thumb
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
              file = File.open(thumbpath)
            end
        end
    end
end