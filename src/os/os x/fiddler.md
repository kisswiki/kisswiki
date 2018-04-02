Fiddler fails to run, either with Mono framework 5.8.1 from dmg or 5.10.0 from brew cask install mono-mdk:

```text
~/Downloads/fiddler-mac$ /Library/Frameworks/Mono.framework/Versions/5.8.1/bin/mozroots --import --sync
Mozilla Roots Importer - version 5.8.1.0
Download and import trusted root certificates from Mozilla's MXR.
Copyright 2002, 2003 Motus Technologies. Copyright 2004-2008 Novell. BSD licensed.

WARNING: mozroots is deprecated, please move to cert-sync instead.

Downloading from 'https://hg.mozilla.org/releases/mozilla-release/raw-file/default/security/nss/lib/ckfw/builtins/certdata.txt'...
Importing certificates into user store...
Import process completed.

~/Downloads/fiddler-mac$ mono Fiddler.exe
WARNING: The Carbon driver has not been ported to 64bits, and very few parts of Windows.Forms will work properly, or at all
Stacktrace:

  at <unknown> <0xffffffff>
  at (wrapper managed-to-native) System.Windows.Forms.XplatUICarbon.CGDisplayBounds (intptr) [0x00002] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.XplatUICarbon.get_WorkingArea () [0x00005] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.XplatUICarbon.get_VirtualScreen () [0x00000] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.XplatUI.get_VirtualScreen () [0x00000] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Screen..cctor () [0x00034] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at (wrapper runtime-invoke) object.runtime_invoke_void (object,intptr,intptr,intptr) [0x0001e] in <e22c1963d07746cd9708456620d50e1a>:0
  at <unknown> <0xffffffff>
  at System.Windows.Forms.Form.get_CreateParams () [0x00157] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Control.CreateHandle () [0x0002a] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Form.CreateHandle () [0x00000] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Control.CreateControl () [0x00039] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Control.SetVisibleCore (bool) [0x0003a] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Form.SetVisibleCore (bool) [0x00065] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Control.set_Visible (bool) [0x00009] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at System.Windows.Forms.Control.Show () [0x00000] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at (wrapper remoting-invoke-with-check) System.Windows.Forms.Control.Show () [0x00031] in <fb1a963a33744b45b030149b1a89dcfe>:0
  at Fiddler.frmViewer. (string[]) [0x00081] in <09623c708fdb40a483cea147bbea7a7f>:0
  at Fiddler.frmViewer. (string[]) [0x00016] in <09623c708fdb40a483cea147bbea7a7f>:0
  at (wrapper runtime-invoke) <Module>.runtime_invoke_void_object (object,intptr,intptr,intptr) [0x0004e] in <09623c708fdb40a483cea147bbea7a7f>:0

Native stacktrace:

	0   mono                                0x000000010f59ab01 mono_handle_native_crash + 257
	1   mono                                0x000000010f605136 altstack_handle_and_restore + 70
	2   SkyLight                            0x00007fff4ba8cfa8 SLDisplayBounds + 83
	3   ???                                 0x00000001190f161e 0x0 + 4715386398
	4   ???                                 0x000000010fbc7486 0x0 + 4558976134
	5   mono                                0x000000010f4efa07 mono_jit_runtime_invoke + 1383
	6   mono                                0x000000010f6b1db4 do_runtime_invoke + 84
	7   mono                                0x000000010f6adf04 mono_runtime_class_init_full + 996
	8   mono                                0x000000010f4e8d0e mono_jit_compile_method_inner + 2478
	9   mono                                0x000000010f4ebbc3 mono_jit_compile_method_with_opt + 1363
	10  mono                                0x000000010f59cfc1 common_call_trampoline + 1217
	11  mono                                0x000000010f59cabc mono_magic_trampoline + 60
	12  ???                                 0x000000010f9b439e 0x0 + 4556800926
	13  ???                                 0x0000000118a7a80b 0x0 + 4708608011
	14  ???                                 0x00000001181d493f 0x0 + 4699539775
	15  ???                                 0x00000001181d45b7 0x0 + 4699538871
	16  ???                                 0x000000010fbc7043 0x0 + 4558975043
	17  mono                                0x000000010f4efa07 mono_jit_runtime_invoke + 1383
	18  mono                                0x000000010f6b1db4 do_runtime_invoke + 84
	19  mono                                0x000000010f6b53d9 do_exec_main_checked + 137
	20  mono                                0x000000010f55e3bf mono_jit_exec + 287
	21  mono                                0x000000010f560bb4 mono_main + 9140
	22  mono                                0x000000010f4df3cd main + 253
	23  mono                                0x000000010f4df2c4 start + 52

Debug info from gdb:

(lldb) command source -s 0 '/tmp/mono-gdb-commands.tSvNEi'
Executing commands in '/tmp/mono-gdb-commands.tSvNEi'.
(lldb) process attach --pid 32768
warning: (x86_64) /Library/Frameworks/Mono.framework/Versions/5.8.1/lib/mono/4.5/mscorlib.dll.dylib empty dSYM file detected, dSYM was created with an executable with no debug info.
warning: (x86_64) /Library/Frameworks/Mono.framework/Versions/5.8.1/lib/libglib-2.0.0.dylib empty dSYM file detected, dSYM was created with an executable with no debug info.
Process 32768 stopped
* thread #1, name = 'tid_307', queue = 'com.apple.main-thread', stop reason = signal SIGSTOP
    frame #0: 0x00007fff51a2d502 libsystem_kernel.dylib`__wait4 + 10
libsystem_kernel.dylib`__wait4:
->  0x7fff51a2d502 <+10>: jae    0x7fff51a2d50c            ; <+20>
    0x7fff51a2d504 <+12>: movq   %rax, %rdi
    0x7fff51a2d507 <+15>: jmp    0x7fff51a240dd            ; cerror
    0x7fff51a2d50c <+20>: retq   
Target 0: (mono) stopped.

Executable module set to "/Library/Frameworks/Mono.framework/Versions/Current/Commands/mono".
Architecture set to: x86_64h-apple-macosx.
(lldb) thread list
Process 32768 stopped
* thread #1: tid = 0x257f92, 0x00007fff51a2d502 libsystem_kernel.dylib`__wait4 + 10, name = 'tid_307', queue = 'com.apple.main-thread', stop reason = signal SIGSTOP
  thread #2: tid = 0x257f9a, 0x00007fff51a2ccee libsystem_kernel.dylib`__psynch_cvwait + 10, name = 'SGen worker'
  thread #3: tid = 0x257f9c, 0x00007fff51a237fe libsystem_kernel.dylib`semaphore_wait_trap + 10, name = 'Finalizer'
  thread #4: tid = 0x257f9e, 0x00007fff51a2d562 libsystem_kernel.dylib`__workq_kernreturn + 10
  thread #5: tid = 0x257f9f, 0x00007fff51a2d562 libsystem_kernel.dylib`__workq_kernreturn + 10
  thread #6: tid = 0x257fa0, 0x00007fff51a2d562 libsystem_kernel.dylib`__workq_kernreturn + 10
  thread #7: tid = 0x257ffd, 0x00007fff51a2ccee libsystem_kernel.dylib`__psynch_cvwait + 10, name = 'Timer-Scheduler'
(lldb) thread backtrace all
* thread #1, name = 'tid_307', queue = 'com.apple.main-thread', stop reason = signal SIGSTOP
  * frame #0: 0x00007fff51a2d502 libsystem_kernel.dylib`__wait4 + 10
    frame #1: 0x000000010f59ab8e mono`mono_handle_native_crash(signal=<unavailable>, ctx=<unavailable>, info=<unavailable>) at mini-exceptions.c:2726 [opt]
    frame #2: 0x000000010f605136 mono`altstack_handle_and_restore(ctx=0x00007ffee07214f0, obj=0x0000000000000000, stack_ovf=0) at exceptions-amd64.c:856 [opt]
    frame #3: 0x00007fff4ba8cfa8 SkyLight`SLDisplayBounds + 83
    frame #4: 0x00000001190f161e
    frame #5: 0x000000010fbc7486
    frame #6: 0x000000010f4efa07 mono`mono_jit_runtime_invoke(method=<unavailable>, obj=<unavailable>, params=0x0000000000000000, exc=0x00000001190f1020, error=<unavailable>) at mini-runtime.c:2800 [opt]
    frame #7: 0x000000010f6b1db4 mono`do_runtime_invoke(method=0x00007fd0469b9548, obj=0x0000000000000000, params=0x0000000000000000, exc=0x00007ffee0721ba8, error=0x00007ffee0721d80) at object.c:2849 [opt]
    frame #8: 0x000000010f6adf04 mono`mono_runtime_class_init_full [inlined] mono_runtime_try_invoke(method=<unavailable>, obj=<unavailable>, params=<unavailable>, error=0x00007ffee0721d80) at object.c:2956 [opt]
    frame #9: 0x000000010f6adebf mono`mono_runtime_class_init_full(vtable=0x00007fd0469fb770, error=0x00007ffee0721d80) at object.c:473 [opt]
    frame #10: 0x000000010f4e8d0e mono`mono_jit_compile_method_inner(method=0x00007fd0469b93d0, target_domain=<unavailable>, opt=<unavailable>, error=0x00007ffee0721d80) at mini.c:4343 [opt]
    frame #11: 0x000000010f4ebbc3 mono`mono_jit_compile_method_with_opt(method=0x00007fd0469b93d0, opt=<unavailable>, jit_only=0, error=<unavailable>) at mini-runtime.c:2129 [opt]
    frame #12: 0x000000010f59cfc1 mono`common_call_trampoline(regs=0x00007ffee0721e48, code="H\x8b?H??\xa8H\x8b??8, m=0x00007fd0469b93d0, vt=<unavailable>, vtable_slot=<unavailable>, error=<unavailable>) at mini-trampolines.c:715 [opt]
    frame #13: 0x000000010f59cabc mono`mono_magic_trampoline(regs=0x00007ffee0721e48, code="H\x8b?H??\xa8H\x8b??8, arg=0x00007fd0469b93d0, tramp=<unavailable>) at mini-trampolines.c:846 [opt]
    frame #14: 0x000000010f9b439e
    frame #15: 0x0000000118a7a80b
    frame #16: 0x00000001181d493f
    frame #17: 0x00000001181d45b7
    frame #18: 0x000000010fbc7043
    frame #19: 0x000000010f4efa07 mono`mono_jit_runtime_invoke(method=<unavailable>, obj=<unavailable>, params=0x00007ffee07226b8, exc=0x000000010fc4f0f8, error=<unavailable>) at mini-runtime.c:2800 [opt]
    frame #20: 0x000000010f6b1db4 mono`do_runtime_invoke(method=0x00007fd04640f648, obj=0x0000000000000000, params=0x00007ffee07226b8, exc=0x0000000000000000, error=0x00007ffee07226f8) at object.c:2849 [opt]
    frame #21: 0x000000010f6b53d9 mono`do_exec_main_checked [inlined] mono_runtime_invoke_checked(method=<unavailable>, obj=<unavailable>, error=<unavailable>) at object.c:3002 [opt]
    frame #22: 0x000000010f6b5398 mono`do_exec_main_checked(method=0x00007fd04640f648, args=<unavailable>, error=0x00007ffee07226f8) at object.c:4726 [opt]
    frame #23: 0x000000010f55e3bf mono`mono_jit_exec(domain=<unavailable>, assembly=<unavailable>, argc=1, argv=0x00007ffee0722a20) at driver.g.c:1040 [opt]
    frame #24: 0x000000010f560bb4 mono`mono_main [inlined] main_thread_handler at driver.g.c:1109 [opt]
    frame #25: 0x000000010f560b81 mono`mono_main(argc=2, argv=<unavailable>) at driver.g.c:2222 [opt]
    frame #26: 0x000000010f4df3cd mono`main [inlined] mono_main_with_options(argc=<unavailable>, argv=<unavailable>) at main.c:46 [opt]
    frame #27: 0x000000010f4df3b9 mono`main(argc=2, argv=<unavailable>) at main.c:339 [opt]
    frame #28: 0x000000010f4df2c4 mono`start + 52
  thread #2, name = 'SGen worker'
    frame #0: 0x00007fff51a2ccee libsystem_kernel.dylib`__psynch_cvwait + 10
    frame #1: 0x00007fff51b69662 libsystem_pthread.dylib`_pthread_cond_wait + 732
    frame #2: 0x000000010f76ac9e mono`thread_func [inlined] mono_os_cond_wait(mutex=<unavailable>) at mono-os-mutex.h:173 [opt]
    frame #3: 0x000000010f76ac8b mono`thread_func at sgen-thread-pool.c:165 [opt]
    frame #4: 0x000000010f76ac7d mono`thread_func(data=0x0000000000000000) at sgen-thread-pool.c:196 [opt]
    frame #5: 0x00007fff51b686c1 libsystem_pthread.dylib`_pthread_body + 340
    frame #6: 0x00007fff51b6856d libsystem_pthread.dylib`_pthread_start + 377
    frame #7: 0x00007fff51b67c5d libsystem_pthread.dylib`thread_start + 13
  thread #3, name = 'Finalizer'
    frame #0: 0x00007fff51a237fe libsystem_kernel.dylib`semaphore_wait_trap + 10
    frame #1: 0x000000010f7172fc mono`finalizer_thread [inlined] mono_os_sem_wait(flags=MONO_SEM_FLAGS_ALERTABLE) at mono-os-semaphore.h:90 [opt]
    frame #2: 0x000000010f7172f1 mono`finalizer_thread at mono-coop-semaphore.h:43 [opt]
    frame #3: 0x000000010f7172e5 mono`finalizer_thread(unused=<unavailable>) at gc.c:866 [opt]
    frame #4: 0x000000010f6d35b0 mono`start_wrapper [inlined] start_wrapper_internal at threads.c:1003 [opt]
    frame #5: 0x000000010f6d3513 mono`start_wrapper(data=<unavailable>) at threads.c:1063 [opt]
    frame #6: 0x00007fff51b686c1 libsystem_pthread.dylib`_pthread_body + 340
    frame #7: 0x00007fff51b6856d libsystem_pthread.dylib`_pthread_start + 377
    frame #8: 0x00007fff51b67c5d libsystem_pthread.dylib`thread_start + 13
  thread #4
    frame #0: 0x00007fff51a2d562 libsystem_kernel.dylib`__workq_kernreturn + 10
    frame #1: 0x00007fff51b6826f libsystem_pthread.dylib`_pthread_wqthread + 1552
    frame #2: 0x00007fff51b67c4d libsystem_pthread.dylib`start_wqthread + 13
  thread #5
    frame #0: 0x00007fff51a2d562 libsystem_kernel.dylib`__workq_kernreturn + 10
    frame #1: 0x00007fff51b6806a libsystem_pthread.dylib`_pthread_wqthread + 1035
    frame #2: 0x00007fff51b67c4d libsystem_pthread.dylib`start_wqthread + 13
  thread #6
    frame #0: 0x00007fff51a2d562 libsystem_kernel.dylib`__workq_kernreturn + 10
    frame #1: 0x00007fff51b6806a libsystem_pthread.dylib`_pthread_wqthread + 1035
    frame #2: 0x00007fff51b67c4d libsystem_pthread.dylib`start_wqthread + 13
  thread #7, name = 'Timer-Scheduler'
    frame #0: 0x00007fff51a2ccee libsystem_kernel.dylib`__psynch_cvwait + 10
    frame #1: 0x00007fff51b6969b libsystem_pthread.dylib`_pthread_cond_wait + 789
    frame #2: 0x000000010f7765d4 mono`mono_os_cond_timedwait(cond=0x00007fd046806160, mutex=0x00007fd046806120, timeout_ms=499) at mono-os-mutex.c:44 [opt]
    frame #3: 0x000000010f6f4764 mono`mono_w32handle_timedwait_signal_handle [inlined] mono_w32handle_timedwait_signal_naked(cond=<unavailable>, mutex=<unavailable>, timeout=499, poll=0, alerted=<unavailable>) at w32handle.c:871 [opt]
    frame #4: 0x000000010f6f475c mono`mono_w32handle_timedwait_signal_handle(handle=<unavailable>, timeout=<unavailable>, poll=0, alerted=<unavailable>) at w32handle.c:988 [opt]
    frame #5: 0x000000010f6f4580 mono`mono_w32handle_wait_one(handle=0x0000000000000002, timeout=499, alertable=<unavailable>) at w32handle.c:1109 [opt]
    frame #6: 0x000000010f6f4896 mono`mono_w32handle_wait_multiple(handles=<unavailable>, nhandles=<unavailable>, waitall=<unavailable>, timeout=<unavailable>, alertable=<unavailable>) at w32handle.c:1145 [opt]
    frame #7: 0x000000010f6ceb44 mono`ves_icall_System_Threading_WaitHandle_Wait_internal(handles=<unavailable>, numhandles=<unavailable>, waitall=<unavailable>, timeout=-1, error=0x0000700001e227a8) at threads.c:1930 [opt]
    frame #8: 0x00000001190ec49d
    frame #9: 0x00000001115d7270 mscorlib.dll.dylib`System_Threading_WaitHandle_InternalWaitOne_System_Runtime_InteropServices_SafeHandle_long_bool_bool + 64
    frame #10: 0x00000001115d721c mscorlib.dll.dylib`System_Threading_WaitHandle_WaitOne_long_bool + 44
    frame #11: 0x00000001115d7083 mscorlib.dll.dylib`System_Threading_WaitHandle_WaitOne_int_bool + 51
    frame #12: 0x00000001115d71ac mscorlib.dll.dylib`System_Threading_WaitHandle_WaitOne_int + 28
    frame #13: 0x00000001115de04f mscorlib.dll.dylib`System_Threading_Timer_Scheduler_SchedulerThread + 2495
    frame #14: 0x00000001115d0017 mscorlib.dll.dylib`System_Threading_ThreadHelper_ThreadStart_Context_object + 151
    frame #15: 0x00000001115cdc61 mscorlib.dll.dylib`System_Threading_ExecutionContext_Run_System_Threading_ExecutionContext_System_Threading_ContextCallback_object_bool + 33
    frame #16: 0x00000001115cdbf0 mscorlib.dll.dylib`System_Threading_ExecutionContext_Run_System_Threading_ExecutionContext_System_Threading_ContextCallback_object + 80
    frame #17: 0x00000001115d015f mscorlib.dll.dylib`System_Threading_ThreadHelper_ThreadStart + 47
    frame #18: 0x000000010fbd2ba9
    frame #19: 0x000000010f4efa07 mono`mono_jit_runtime_invoke(method=<unavailable>, obj=<unavailable>, params=0x0000700001e22ea8, exc=0x000000010fc4e330, error=<unavailable>) at mini-runtime.c:2800 [opt]
    frame #20: 0x000000010f6b1db4 mono`do_runtime_invoke(method=0x00007fd04803f138, obj=0x000000010fc4e4d0, params=0x0000700001e22ea8, exc=0x0000000000000000, error=0x0000700001e22e40) at object.c:2849 [opt]
    frame #21: 0x000000010f6d35db mono`start_wrapper at threads.c:1011 [opt]
    frame #22: 0x000000010f6d3513 mono`start_wrapper(data=<unavailable>) at threads.c:1063 [opt]
    frame #23: 0x00007fff51b686c1 libsystem_pthread.dylib`_pthread_body + 340
    frame #24: 0x00007fff51b6856d libsystem_pthread.dylib`_pthread_start + 377
    frame #25: 0x00007fff51b67c5d libsystem_pthread.dylib`thread_start + 13
(lldb) detach

=================================================================
Got a SIGSEGV while executing native code. This usually indicates
a fatal error in the mono runtime or one of the native libraries 
used by your application.
=================================================================

Process 32768 detached
(lldb) quit
Abort trap: 6
```