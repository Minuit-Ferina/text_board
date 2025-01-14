mkdir -p opt/bin
cd opt/bin
curl -L -o LSL-PyOptimizer.zip https://github.com/Sei-Lisa/LSL-PyOptimizer/archive/refs/heads/master.zip
unzip -o LSL-PyOptimizer
mv LSL-PyOptimizer-master LSL-PyOptimizer
cd ..

mkdir -p opt/include
cd opt/include
curl -L -o SetLinkTextureFast.lsl https://raw.githubusercontent.com/Minuit-Ferina/SetLinkTextureFast.lsl/refs/heads/main/SetLinkTextureFast.lsl
curl -L -o PrimLinkFinder.lsl  https://raw.githubusercontent.com/Minuit-Ferina/PrimLinkFinder.lsl/refs/heads/main/PrimLinkFinder.lsl
curl -L -o PrimLinkFinder.lsl  https://raw.githubusercontent.com/Minuit-Ferina/PrimLinkFinder.lsl/refs/heads/main/PrimLinkFinder.lsl
cd ..

