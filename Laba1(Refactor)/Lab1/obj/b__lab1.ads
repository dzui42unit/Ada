pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 6.3.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_lab1" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#64c0e332#;
   pragma Export (C, u00001, "lab1B");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#ddf3267e#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#5e196e91#;
   pragma Export (C, u00005, "ada__containersS");
   u00006 : constant Version_32 := 16#2da59038#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00007, "system__exception_tableB");
   u00008 : constant Version_32 := 16#700bf97a#;
   pragma Export (C, u00008, "system__exception_tableS");
   u00009 : constant Version_32 := 16#465d427a#;
   pragma Export (C, u00009, "system__soft_linksB");
   u00010 : constant Version_32 := 16#b321486d#;
   pragma Export (C, u00010, "system__soft_linksS");
   u00011 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00011, "system__parametersB");
   u00012 : constant Version_32 := 16#538f9d47#;
   pragma Export (C, u00012, "system__parametersS");
   u00013 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00013, "system__secondary_stackB");
   u00014 : constant Version_32 := 16#86c45f51#;
   pragma Export (C, u00014, "system__secondary_stackS");
   u00015 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00015, "system__storage_elementsB");
   u00016 : constant Version_32 := 16#0066da3c#;
   pragma Export (C, u00016, "system__storage_elementsS");
   u00017 : constant Version_32 := 16#da4d2671#;
   pragma Export (C, u00017, "ada__exceptionsB");
   u00018 : constant Version_32 := 16#4c8cceba#;
   pragma Export (C, u00018, "ada__exceptionsS");
   u00019 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00019, "ada__exceptions__last_chance_handlerB");
   u00020 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00020, "ada__exceptions__last_chance_handlerS");
   u00021 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00021, "system__exceptionsB");
   u00022 : constant Version_32 := 16#45c6fdce#;
   pragma Export (C, u00022, "system__exceptionsS");
   u00023 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00023, "system__exceptions__machineS");
   u00024 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00024, "system__exceptions_debugB");
   u00025 : constant Version_32 := 16#532f69fc#;
   pragma Export (C, u00025, "system__exceptions_debugS");
   u00026 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00026, "system__img_intB");
   u00027 : constant Version_32 := 16#2f7e70fa#;
   pragma Export (C, u00027, "system__img_intS");
   u00028 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00028, "system__tracebackB");
   u00029 : constant Version_32 := 16#73874efc#;
   pragma Export (C, u00029, "system__tracebackS");
   u00030 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00030, "system__traceback_entriesB");
   u00031 : constant Version_32 := 16#2dfe6648#;
   pragma Export (C, u00031, "system__traceback_entriesS");
   u00032 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00032, "system__traceback__symbolicB");
   u00033 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00033, "system__traceback__symbolicS");
   u00034 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00034, "ada__exceptions__tracebackB");
   u00035 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00035, "ada__exceptions__tracebackS");
   u00036 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00036, "system__address_imageB");
   u00037 : constant Version_32 := 16#8c490d02#;
   pragma Export (C, u00037, "system__address_imageS");
   u00038 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00038, "system__wch_conB");
   u00039 : constant Version_32 := 16#36d8b2ea#;
   pragma Export (C, u00039, "system__wch_conS");
   u00040 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00040, "system__wch_stwB");
   u00041 : constant Version_32 := 16#1bc99eeb#;
   pragma Export (C, u00041, "system__wch_stwS");
   u00042 : constant Version_32 := 16#b96cfbef#;
   pragma Export (C, u00042, "system__wch_cnvB");
   u00043 : constant Version_32 := 16#396f0819#;
   pragma Export (C, u00043, "system__wch_cnvS");
   u00044 : constant Version_32 := 16#4be8ce1b#;
   pragma Export (C, u00044, "interfacesS");
   u00045 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00045, "system__wch_jisB");
   u00046 : constant Version_32 := 16#b91f1138#;
   pragma Export (C, u00046, "system__wch_jisS");
   u00047 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00047, "system__stack_checkingB");
   u00048 : constant Version_32 := 16#a31afbd0#;
   pragma Export (C, u00048, "system__stack_checkingS");
   u00049 : constant Version_32 := 16#14d67c72#;
   pragma Export (C, u00049, "ada__containers__helpersB");
   u00050 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00050, "ada__containers__helpersS");
   u00051 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00051, "ada__finalizationS");
   u00052 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00052, "ada__streamsB");
   u00053 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00053, "ada__streamsS");
   u00054 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00054, "ada__io_exceptionsS");
   u00055 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00055, "ada__tagsB");
   u00056 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00056, "ada__tagsS");
   u00057 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00057, "system__htableB");
   u00058 : constant Version_32 := 16#a96723d2#;
   pragma Export (C, u00058, "system__htableS");
   u00059 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00059, "system__string_hashB");
   u00060 : constant Version_32 := 16#0b3948ac#;
   pragma Export (C, u00060, "system__string_hashS");
   u00061 : constant Version_32 := 16#b0fd34f8#;
   pragma Export (C, u00061, "system__unsigned_typesS");
   u00062 : constant Version_32 := 16#b44f9ae7#;
   pragma Export (C, u00062, "system__val_unsB");
   u00063 : constant Version_32 := 16#a055d9c3#;
   pragma Export (C, u00063, "system__val_unsS");
   u00064 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00064, "system__val_utilB");
   u00065 : constant Version_32 := 16#810526c6#;
   pragma Export (C, u00065, "system__val_utilS");
   u00066 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00066, "system__case_utilB");
   u00067 : constant Version_32 := 16#09acf9ef#;
   pragma Export (C, u00067, "system__case_utilS");
   u00068 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00068, "system__finalization_rootB");
   u00069 : constant Version_32 := 16#6257e3a8#;
   pragma Export (C, u00069, "system__finalization_rootS");
   u00070 : constant Version_32 := 16#12218162#;
   pragma Export (C, u00070, "system__atomic_countersB");
   u00071 : constant Version_32 := 16#99f9bdb5#;
   pragma Export (C, u00071, "system__atomic_countersS");
   u00072 : constant Version_32 := 16#221eebf6#;
   pragma Export (C, u00072, "system__machine_codeS");
   u00073 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00073, "ada__integer_text_ioB");
   u00074 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00074, "ada__integer_text_ioS");
   u00075 : constant Version_32 := 16#c1a106e2#;
   pragma Export (C, u00075, "ada__text_ioB");
   u00076 : constant Version_32 := 16#c3f01c15#;
   pragma Export (C, u00076, "ada__text_ioS");
   u00077 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00077, "interfaces__c_streamsB");
   u00078 : constant Version_32 := 16#a06e9ee4#;
   pragma Export (C, u00078, "interfaces__c_streamsS");
   u00079 : constant Version_32 := 16#5d344636#;
   pragma Export (C, u00079, "system__crtlS");
   u00080 : constant Version_32 := 16#f1dc49a7#;
   pragma Export (C, u00080, "system__file_ioB");
   u00081 : constant Version_32 := 16#8ad4715d#;
   pragma Export (C, u00081, "system__file_ioS");
   u00082 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00082, "interfaces__cB");
   u00083 : constant Version_32 := 16#61e3d2ff#;
   pragma Export (C, u00083, "interfaces__cS");
   u00084 : constant Version_32 := 16#f7f07252#;
   pragma Export (C, u00084, "system__os_libB");
   u00085 : constant Version_32 := 16#dc0cac3f#;
   pragma Export (C, u00085, "system__os_libS");
   u00086 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00086, "system__stringsB");
   u00087 : constant Version_32 := 16#531a815e#;
   pragma Export (C, u00087, "system__stringsS");
   u00088 : constant Version_32 := 16#d03a0a90#;
   pragma Export (C, u00088, "system__file_control_blockS");
   u00089 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00089, "ada__text_io__integer_auxB");
   u00090 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00090, "ada__text_io__integer_auxS");
   u00091 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00091, "ada__text_io__generic_auxB");
   u00092 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00092, "ada__text_io__generic_auxS");
   u00093 : constant Version_32 := 16#18d57884#;
   pragma Export (C, u00093, "system__img_biuB");
   u00094 : constant Version_32 := 16#76dfbcb5#;
   pragma Export (C, u00094, "system__img_biuS");
   u00095 : constant Version_32 := 16#e7d8734f#;
   pragma Export (C, u00095, "system__img_llbB");
   u00096 : constant Version_32 := 16#3718ac4b#;
   pragma Export (C, u00096, "system__img_llbS");
   u00097 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00097, "system__img_lliB");
   u00098 : constant Version_32 := 16#3ceac5e9#;
   pragma Export (C, u00098, "system__img_lliS");
   u00099 : constant Version_32 := 16#0e8808d4#;
   pragma Export (C, u00099, "system__img_llwB");
   u00100 : constant Version_32 := 16#9e748fdd#;
   pragma Export (C, u00100, "system__img_llwS");
   u00101 : constant Version_32 := 16#428b07f8#;
   pragma Export (C, u00101, "system__img_wiuB");
   u00102 : constant Version_32 := 16#189e3b27#;
   pragma Export (C, u00102, "system__img_wiuS");
   u00103 : constant Version_32 := 16#7ebd8839#;
   pragma Export (C, u00103, "system__val_intB");
   u00104 : constant Version_32 := 16#6500ba07#;
   pragma Export (C, u00104, "system__val_intS");
   u00105 : constant Version_32 := 16#b3aa7b17#;
   pragma Export (C, u00105, "system__val_lliB");
   u00106 : constant Version_32 := 16#b7817698#;
   pragma Export (C, u00106, "system__val_lliS");
   u00107 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00107, "system__val_lluB");
   u00108 : constant Version_32 := 16#ca0f638a#;
   pragma Export (C, u00108, "system__val_lluS");
   u00109 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00109, "system__concat_2B");
   u00110 : constant Version_32 := 16#2f0547e8#;
   pragma Export (C, u00110, "system__concat_2S");
   u00111 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00111, "system__finalization_mastersB");
   u00112 : constant Version_32 := 16#7659a9f2#;
   pragma Export (C, u00112, "system__finalization_mastersS");
   u00113 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00113, "system__img_boolB");
   u00114 : constant Version_32 := 16#d87ce1d3#;
   pragma Export (C, u00114, "system__img_boolS");
   u00115 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00115, "system__ioB");
   u00116 : constant Version_32 := 16#b3e76777#;
   pragma Export (C, u00116, "system__ioS");
   u00117 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00117, "system__storage_poolsB");
   u00118 : constant Version_32 := 16#0e480e95#;
   pragma Export (C, u00118, "system__storage_poolsS");
   u00119 : constant Version_32 := 16#e78389d8#;
   pragma Export (C, u00119, "system__storage_pools__subpoolsB");
   u00120 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00120, "system__storage_pools__subpoolsS");
   u00121 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00121, "system__storage_pools__subpools__finalizationB");
   u00122 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00122, "system__storage_pools__subpools__finalizationS");
   u00123 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00123, "system__stream_attributesB");
   u00124 : constant Version_32 := 16#221dd20d#;
   pragma Export (C, u00124, "system__stream_attributesS");
   u00125 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00125, "system__memoryB");
   u00126 : constant Version_32 := 16#74d8f60c#;
   pragma Export (C, u00126, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  lab1%b
   --  END ELABORATION ORDER


end ada_main;
