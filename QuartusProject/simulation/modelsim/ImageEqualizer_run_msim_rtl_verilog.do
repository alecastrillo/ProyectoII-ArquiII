transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/ls.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/norm.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/adder.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/inc.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/mods.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/mux_LANE.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/lane.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/LANE/LANES.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU/add.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU/cmp.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU/mux_ALU.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU/ALU.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/ALU/flags.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/controlUnit.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/decoder.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_vector.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/PCREG.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline/pipe_FtoD.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline/pipe_DtoE.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline/pipe_EtoM.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline/pipe_MtoW.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_pc.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_WB.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_VorH.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_HSrc.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/pipeline.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_ImmSrc.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/mux_GET8.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/hazardUnit.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/dataMemory.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/vectorRegisterFile.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/instructionMemory.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/scalarRegisterFile.sv}
vlog -sv -work work +incdir+/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject {/home/alecastrillo/Cursos/Arqui/ProyectoII/ProyectoII-ArquiII/QuartusProject/histogramRegisterFile.sv}

