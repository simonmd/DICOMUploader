require 'dicom'
include DICOM
module Edx
    module CarrierWave
        module Dicom

            module ClassMethods
                def summary
                  process :summary
                end
            end

            def summary
              obj = DObject.new(path)
              return obj.summary
            end
        end
    end
end