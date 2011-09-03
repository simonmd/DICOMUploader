require 'dicom'
include DICOM
module Edx
    module CarrierWave
        module Dicom

            module ClassMethods
                def summary
                  process :dicomdata
                end
            end

            def dicomdata
              dcmobj = DObject.new(path)
              return dcmobj
            end
        end
    end
end