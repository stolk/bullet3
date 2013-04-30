function createProject(vendor)
	hasCL = findOpenCL(vendor)
	
	if (hasCL) then

		project ("Test_OpenCL_RadixSortBenchmark_" .. vendor)

		initOpenCL(vendor)
		
		language "C++"
				
		kind "ConsoleApp"
		targetdir "../../../bin"
		includedirs {"..","../../../src"}
		
--		links {
--			("OpenCL_lib_parallel_primitives_host_" .. vendor)
--		}
		
		files {
			"main.cpp",
			"../../../src/Bullet3OpenCL/Initialize/b3OpenCLUtils.cpp",
			"../../../src/Bullet3OpenCL/Initialize/b3OpenCLUtils.h",
			"../../../src/Bullet3OpenCL/ParallelPrimitives/b3FillCL.cpp",
			"../../../src/Bullet3OpenCL/ParallelPrimitives/b3PrefixScanCL.cpp",
			"../../../src/Bullet3OpenCL/ParallelPrimitives/b3RadixSort32CL.cpp",
			"../../../src/Bullet3Common/b3AlignedAllocator.cpp",
			"../../../src/Bullet3Common/b3AlignedAllocator.h",
			"../../../src/Bullet3Common/b3AlignedObjectArray.h",
			"../../../src/Bullet3Common/b3Quickprof.cpp",
			"../../../src/Bullet3Common/b3Quickprof.h",
		}
		
	end
end

createProject("AMD")
createProject("Intel")
createProject("NVIDIA")
createProject("Apple")