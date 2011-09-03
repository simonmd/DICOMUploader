require 'dicom'
include DICOM
module Edx
    module CarrierWave
        module Dicom

            module ClassMethods
                def summary
                  process :extract_dicomdata
                end
            end

            def extract_dicomdata
              dcmobj = DObject.new(path)
              return dcmobj
            end
        end
    end
end