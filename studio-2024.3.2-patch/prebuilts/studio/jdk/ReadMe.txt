commit 405c92abeda817f46e6370d1a3ba4c85cc820e04
Author: pengcui <pngcui1224@163.com>
Date:   Tue Sep 9 14:01:20 2025 +0800

    add jdk17 and jdk8 for aarch64
    
    Change-Id: I966bc97d323c38e63c965d2463ab0caa4df19a97

 jdk17/linux/NOTICE                                 |   63 +
 jdk17/linux/bin/jar                                |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jarsigner                          |  Bin 8760 -> 70720 bytes
 jdk17/linux/bin/java                               |  Bin 8624 -> 70704 bytes
 jdk17/linux/bin/javac                              |  Bin 8840 -> 70736 bytes
 jdk17/linux/bin/javadoc                            |  Bin 8856 -> 70736 bytes
 jdk17/linux/bin/javap                              |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jcmd                               |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jconsole                           |  Bin 9096 -> 70768 bytes
 jdk17/linux/bin/jdb                                |  Bin 8760 -> 70720 bytes
 jdk17/linux/bin/jdeprscan                          |  Bin 8760 -> 70720 bytes
 jdk17/linux/bin/jdeps                              |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jfr                                |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jhsdb                              |  Bin 8760 -> 70720 bytes
 jdk17/linux/bin/jimage                             |  Bin 8728 -> 70720 bytes
 jdk17/linux/bin/jinfo                              |  Bin 8904 -> 70736 bytes
 jdk17/linux/bin/jlink                              |  Bin 8840 -> 70736 bytes
 jdk17/linux/bin/jmap                               |  Bin 8904 -> 70736 bytes
 jdk17/linux/bin/jmod                               |  Bin 8728 -> 70720 bytes
 jdk17/linux/bin/jpackage                           |  Bin 8760 -> 70720 bytes
 jdk17/linux/bin/jps                                |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jrunscript                         |  Bin 8864 -> 70744 bytes
 jdk17/linux/bin/jshell                             |  Bin 8776 -> 70720 bytes
 jdk17/linux/bin/jstack                             |  Bin 8904 -> 70736 bytes
 jdk17/linux/bin/jstat                              |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/jstatd                             |  Bin 8744 -> 70720 bytes
 jdk17/linux/bin/keytool                            |  Bin 8760 -> 70720 bytes
 jdk17/linux/bin/rmiregistry                        |  Bin 8768 -> 70728 bytes
 jdk17/linux/bin/serialver                          |  Bin 8760 -> 70720 bytes
 jdk17/linux/conf/net.properties                    |   17 +
 jdk17/linux/conf/security/java.policy              |    2 +
 jdk17/linux/conf/security/java.security            |   11 +-
 jdk17/linux/jmods/java.base.jmod                   |  Bin 20931267 -> 21979326 bytes
 jdk17/linux/jmods/java.compiler.jmod               |  Bin 130563 -> 130711 bytes
 jdk17/linux/jmods/java.datatransfer.jmod           |  Bin 59129 -> 59141 bytes
 jdk17/linux/jmods/java.desktop.jmod                |  Bin 18797471 -> 13687210 bytes
 jdk17/linux/jmods/java.instrument.jmod             |  Bin 45788 -> 47403 bytes
 jdk17/linux/jmods/java.logging.jmod                |  Bin 128135 -> 128179 bytes
 jdk17/linux/jmods/java.management.jmod             |  Bin 902540 -> 905010 bytes
 jdk17/linux/jmods/java.management.rmi.jmod         |  Bin 99801 -> 99524 bytes
 jdk17/linux/jmods/java.naming.jmod                 |  Bin 475329 -> 475786 bytes
 jdk17/linux/jmods/java.net.http.jmod               |  Bin 746377 -> 757975 bytes
 jdk17/linux/jmods/java.prefs.jmod                  |  Bin 69325 -> 69942 bytes
 jdk17/linux/jmods/java.rmi.jmod                    |  Bin 272104 -> 273463 bytes
 jdk17/linux/jmods/java.scripting.jmod              |  Bin 48083 -> 48721 bytes
 jdk17/linux/jmods/java.se.jmod                     |  Bin 9859 -> 9859 bytes
 jdk17/linux/jmods/java.security.jgss.jmod          |  Bin 617484 -> 619750 bytes
 jdk17/linux/jmods/java.security.sasl.jmod          |  Bin 89346 -> 89369 bytes
 jdk17/linux/jmods/java.smartcardio.jmod            |  Bin 63259 -> 64351 bytes
 jdk17/linux/jmods/java.sql.jmod                    |  Bin 83674 -> 83694 bytes
 jdk17/linux/jmods/java.sql.rowset.jmod             |  Bin 221218 -> 221189 bytes
 jdk17/linux/jmods/java.transaction.xa.jmod         |  Bin 11687 -> 11688 bytes
 jdk17/linux/jmods/java.xml.crypto.jmod             |  Bin 693559 -> 693666 bytes
 jdk17/linux/jmods/java.xml.jmod                    |  Bin 5220392 -> 5222001 bytes
 jdk17/linux/jmods/jdk.accessibility.jmod           |  Bin 58044 -> 58052 bytes
 jdk17/linux/jmods/jdk.attach.jmod                  |  Bin 37900 -> 39031 bytes
 jdk17/linux/jmods/jdk.charsets.jmod                |  Bin 1197716 -> 1197717 bytes
 jdk17/linux/jmods/jdk.compiler.jmod                |  Bin 9247227 -> 9248636 bytes
 jdk17/linux/jmods/jdk.crypto.cryptoki.jmod         |  Bin 384293 -> 389317 bytes
 jdk17/linux/jmods/jdk.crypto.ec.jmod               |  Bin 139722 -> 139832 bytes
 jdk17/linux/jmods/jdk.dynalink.jmod                |  Bin 165924 -> 166028 bytes
 jdk17/linux/jmods/jdk.editpad.jmod                 |  Bin 15298 -> 15298 bytes
 jdk17/linux/jmods/jdk.hotspot.agent.jmod           |  Bin 2334791 -> 2337611 bytes
 jdk17/linux/jmods/jdk.httpserver.jmod              |  Bin 114188 -> 114891 bytes
 jdk17/linux/jmods/jdk.incubator.foreign.jmod       |  Bin 325281 -> 326381 bytes
 jdk17/linux/jmods/jdk.incubator.vector.jmod        |  Bin 714453 -> 712949 bytes
 jdk17/linux/jmods/jdk.internal.ed.jmod             |  Bin 15168 -> 15170 bytes
 jdk17/linux/jmods/jdk.internal.jvmstat.jmod        |  Bin 102420 -> 102486 bytes
 jdk17/linux/jmods/jdk.internal.le.jmod             |  Bin 437535 -> 463748 bytes
 jdk17/linux/jmods/jdk.internal.opt.jmod            |  Bin 90608 -> 90619 bytes
 jdk17/linux/jmods/jdk.internal.vm.ci.jmod          |  Bin 454062 -> 454062 bytes
 jdk17/linux/jmods/jdk.internal.vm.compiler.jmod    |  Bin 9647 -> 9648 bytes
 .../jmods/jdk.internal.vm.compiler.management.jmod |  Bin 9654 -> 9654 bytes
 jdk17/linux/jmods/jdk.jartool.jmod                 |  Bin 268115 -> 270579 bytes
 jdk17/linux/jmods/jdk.javadoc.jmod                 |  Bin 1386865 -> 1386754 bytes
 jdk17/linux/jmods/jdk.jcmd.jmod                    |  Bin 139146 -> 143065 bytes
 jdk17/linux/jmods/jdk.jconsole.jmod                |  Bin 477653 -> 478573 bytes
 jdk17/linux/jmods/jdk.jdeps.jmod                   |  Bin 746345 -> 748628 bytes
 jdk17/linux/jmods/jdk.jdi.jmod                     |  Bin 850194 -> 851562 bytes
 jdk17/linux/jmods/jdk.jdwp.agent.jmod              |  Bin 144387 -> 148872 bytes
 jdk17/linux/jmods/jdk.jfr.jmod                     |  Bin 648405 -> 649107 bytes
 jdk17/linux/jmods/jdk.jlink.jmod                   |  Bin 417342 -> 425874 bytes
 jdk17/linux/jmods/jdk.jpackage.jmod                |  Bin 654154 -> 735537 bytes
 jdk17/linux/jmods/jdk.jshell.jmod                  |  Bin 686421 -> 687247 bytes
 jdk17/linux/jmods/jdk.jsobject.jmod                |  Bin 10752 -> 10755 bytes
 jdk17/linux/jmods/jdk.jstatd.jmod                  |  Bin 37547 -> 38280 bytes
 jdk17/linux/jmods/jdk.localedata.jmod              |  Bin 10252738 -> 10252731 bytes
 jdk17/linux/jmods/jdk.management.agent.jmod        |  Bin 97400 -> 97966 bytes
 jdk17/linux/jmods/jdk.management.jfr.jmod          |  Bin 62226 -> 62210 bytes
 jdk17/linux/jmods/jdk.management.jmod              |  Bin 77123 -> 79167 bytes
 jdk17/linux/jmods/jdk.naming.dns.jmod              |  Bin 69855 -> 69882 bytes
 jdk17/linux/jmods/jdk.naming.rmi.jmod              |  Bin 30860 -> 30861 bytes
 jdk17/linux/jmods/jdk.net.jmod                     |  Bin 31338 -> 31970 bytes
 jdk17/linux/jmods/jdk.nio.mapmode.jmod             |  Bin 10223 -> 10224 bytes
 jdk17/linux/jmods/jdk.random.jmod                  |  Bin 29529 -> 29529 bytes
 jdk17/linux/jmods/jdk.sctp.jmod                    |  Bin 92798 -> 94390 bytes
 jdk17/linux/jmods/jdk.security.auth.jmod           |  Bin 75337 -> 75789 bytes
 jdk17/linux/jmods/jdk.security.jgss.jmod           |  Bin 32852 -> 32854 bytes
 jdk17/linux/jmods/jdk.unsupported.desktop.jmod     |  Bin 21629 -> 21630 bytes
 jdk17/linux/jmods/jdk.unsupported.jmod             |  Bin 24980 -> 25015 bytes
 jdk17/linux/jmods/jdk.xml.dom.jmod                 |  Bin 49990 -> 49991 bytes
 jdk17/linux/jmods/jdk.zipfs.jmod                   |  Bin 112817 -> 112825 bytes
 jdk17/linux/legal/java.base/public_suffix.md       |    2 +-
 jdk17/linux/legal/java.desktop/giflib.md           |   26 +-
 jdk17/linux/legal/java.desktop/libpng.md           |   43 +-
 jdk17/linux/legal/java.desktop/pipewire.md         |   41 +
 .../legal/jdk.crypto.cryptoki/pkcs11cryptotoken.md |   24 +-
 jdk17/linux/legal/jdk.internal.le/jline.md         |    4 +-
 jdk17/linux/legal/jdk.javadoc/jquery.md            |   50 +-
 jdk17/linux/lib/classlist                          |   13 +-
 jdk17/linux/lib/ct.sym                             |  Bin 8301486 -> 8301486 bytes
 jdk17/linux/lib/fonts/DroidSans-Bold.ttf           |  Bin 194488 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSans.ttf                |  Bin 190776 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSansMono.ttf            |  Bin 119380 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSansMonoDotted.ttf      |  Bin 117696 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSansMonoSlashed.ttf     |  Bin 117744 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSerif-Bold.ttf          |  Bin 185228 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSerif-BoldItalic.ttf    |  Bin 190304 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSerif-Italic.ttf        |  Bin 177560 -> 0 bytes
 jdk17/linux/lib/fonts/DroidSerif-Regular.ttf       |  Bin 172916 -> 0 bytes
 jdk17/linux/lib/fonts/FiraCode-Bold.ttf            |  Bin 324328 -> 0 bytes
 jdk17/linux/lib/fonts/FiraCode-Light.ttf           |  Bin 285000 -> 0 bytes
 jdk17/linux/lib/fonts/FiraCode-Medium.ttf          |  Bin 294960 -> 0 bytes
 jdk17/linux/lib/fonts/FiraCode-Regular.ttf         |  Bin 299152 -> 0 bytes
 jdk17/linux/lib/fonts/FiraCode-Retina.ttf          |  Bin 295252 -> 0 bytes
 jdk17/linux/lib/fonts/Inconsolata.ttf              |  Bin 22416 -> 0 bytes
 jdk17/linux/lib/fonts/Inter-Italic.otf             |  Bin 271400 -> 0 bytes
 jdk17/linux/lib/fonts/Inter-Regular.otf            |  Bin 258992 -> 0 bytes
 jdk17/linux/lib/fonts/Inter-SemiBold.otf           |  Bin 270760 -> 0 bytes
 jdk17/linux/lib/fonts/Inter-SemiBoldItalic.otf     |  Bin 279536 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-Bold.ttf       |  Bin 277828 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-BoldItalic.ttf |  Bin 279832 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-ExtraBold.ttf  |  Bin 279404 -> 0 bytes
 .../lib/fonts/JetBrainsMono-ExtraBoldItalic.ttf    |  Bin 281616 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-ExtraLight.ttf |  Bin 274144 -> 0 bytes
 .../lib/fonts/JetBrainsMono-ExtraLightItalic.ttf   |  Bin 274240 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-Italic.ttf     |  Bin 276840 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-Light.ttf      |  Bin 276452 -> 0 bytes
 .../linux/lib/fonts/JetBrainsMono-LightItalic.ttf  |  Bin 277104 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-Medium.ttf     |  Bin 273860 -> 0 bytes
 .../linux/lib/fonts/JetBrainsMono-MediumItalic.ttf |  Bin 276804 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-Regular.ttf    |  Bin 273900 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-SemiBold.ttf   |  Bin 277092 -> 0 bytes
 .../lib/fonts/JetBrainsMono-SemiBoldItalic.ttf     |  Bin 279828 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-Thin.ttf       |  Bin 270112 -> 0 bytes
 jdk17/linux/lib/fonts/JetBrainsMono-ThinItalic.ttf |  Bin 272984 -> 0 bytes
 jdk17/linux/lib/fonts/Roboto-Light.ttf             |  Bin 140276 -> 0 bytes
 jdk17/linux/lib/fonts/Roboto-Thin.ttf              |  Bin 130044 -> 0 bytes
 jdk17/linux/lib/fonts/SourceCodePro-Bold.ttf       |  Bin 197004 -> 0 bytes
 jdk17/linux/lib/fonts/SourceCodePro-BoldIt.ttf     |  Bin 162976 -> 0 bytes
 jdk17/linux/lib/fonts/SourceCodePro-It.ttf         |  Bin 163624 -> 0 bytes
 jdk17/linux/lib/fonts/SourceCodePro-Regular.ttf    |  Bin 197644 -> 0 bytes
 jdk17/linux/lib/fonts/font.conf                    |   22 -
 jdk17/linux/lib/fonts/fonts.dir                    |  450 --
 jdk17/linux/lib/jexec                              |  Bin 9376 -> 71032 bytes
 jdk17/linux/lib/jfr/default.jfc                    |    1 +
 jdk17/linux/lib/jfr/profile.jfc                    |    1 +
 jdk17/linux/lib/jrt-fs.jar                         |  Bin 110515 -> 110512 bytes
 jdk17/linux/lib/jspawnhelper                       |  Bin 14992 -> 72472 bytes
 jdk17/linux/lib/libattach.so                       |  Bin 10920 -> 71048 bytes
 jdk17/linux/lib/libawt.so                          |  Bin 811648 -> 828496 bytes
 jdk17/linux/lib/libawt_headless.so                 |  Bin 41488 -> 76920 bytes
 jdk17/linux/lib/libawt_xawt.so                     |  Bin 473680 -> 631624 bytes
 jdk17/linux/lib/libdt_socket.so                    |  Bin 27320 -> 74032 bytes
 jdk17/linux/lib/libextnet.so                       |  Bin 11152 -> 70840 bytes
 jdk17/linux/lib/libfontmanager.so                  |  Bin 2550088 -> 1672784 bytes
 jdk17/linux/lib/libinstrument.so                   |  Bin 48600 -> 76656 bytes
 jdk17/linux/lib/libj2gss.so                        |  Bin 44416 -> 76704 bytes
 jdk17/linux/lib/libj2pcsc.so                       |  Bin 16112 -> 71752 bytes
 jdk17/linux/lib/libj2pkcs11.so                     |  Bin 87024 -> 147552 bytes
 jdk17/linux/lib/libjaas.so                         |  Bin 7200 -> 69928 bytes
 jdk17/linux/lib/libjava.so                         |  Bin 180560 -> 245824 bytes
 jdk17/linux/lib/libjavajpeg.so                     |  Bin 223024 -> 284696 bytes
 jdk17/linux/lib/libjawt.so                         |  Bin 6840 -> 69736 bytes
 jdk17/linux/lib/libjdwp.so                         |  Bin 279680 -> 368368 bytes
 jdk17/linux/lib/libjimage.so                       |  Bin 152128 -> 162672 bytes
 jdk17/linux/lib/libjli.so                          |  Bin 105272 -> 147136 bytes
 jdk17/linux/lib/libjsig.so                         |  Bin 10232 -> 70928 bytes
 jdk17/linux/lib/libjsound.so                       |  Bin 95704 -> 87704 bytes
 jdk17/linux/lib/libjsvml.so                        |  Bin 5040 -> 0 bytes
 jdk17/linux/lib/liblcms.so                         |  Bin 454272 -> 590488 bytes
 jdk17/linux/lib/libmanagement.so                   |  Bin 24152 -> 75936 bytes
 jdk17/linux/lib/libmanagement_agent.so             |  Bin 6568 -> 69808 bytes
 jdk17/linux/lib/libmanagement_ext.so               |  Bin 28160 -> 75480 bytes
 jdk17/linux/lib/libmlib_image.so                   |  Bin 633920 -> 606312 bytes
 jdk17/linux/lib/libnet.so                          |  Bin 96400 -> 152688 bytes
 jdk17/linux/lib/libnio.so                          |  Bin 96672 -> 157064 bytes
 jdk17/linux/lib/libprefs.so                        |  Bin 7504 -> 69952 bytes
 jdk17/linux/lib/librmi.so                          |  Bin 5712 -> 69496 bytes
 jdk17/linux/lib/libsaproc.so                       |  Bin 184752 -> 230064 bytes
 jdk17/linux/lib/libsctp.so                         |  Bin 25120 -> 74056 bytes
 jdk17/linux/lib/libsplashscreen.so                 |  Bin 485384 -> 512216 bytes
 jdk17/linux/lib/libsyslookup.so                    |  Bin 5448 -> 69512 bytes
 jdk17/linux/lib/libverify.so                       |  Bin 61480 -> 73600 bytes
 jdk17/linux/lib/libzip.so                          |  Bin 129992 -> 147280 bytes
 jdk17/linux/lib/modules                            |  Bin 129957082 -> 130213314 bytes
 jdk17/linux/lib/security/cacerts                   |  Bin 122594 -> 174139 bytes
 jdk17/linux/lib/security/public_suffix_list.dat    |  Bin 228598 -> 228507 bytes
 jdk17/linux/lib/server/classes.jsa                 |  Bin 13885440 -> 13828096 bytes
 jdk17/linux/lib/server/classes_nocoops.jsa         |  Bin 12718080 -> 12517376 bytes
 jdk17/linux/lib/server/libjsig.so                  |  Bin 10232 -> 70928 bytes
 jdk17/linux/lib/server/libjvm.so                   |  Bin 22824184 -> 24146008 bytes
 jdk17/linux/lib/src.zip                            |  Bin 51928667 -> 51382541 bytes
 jdk17/linux/lib/tzdb.dat                           |  Bin 104163 -> 101803 bytes
 jdk17/linux/man/man1/jar.1                         |  354 ++
 jdk17/linux/man/man1/jarsigner.1                   | 1484 ++++++
 jdk17/linux/man/man1/java.1                        | 5602 ++++++++++++++++++++
 jdk17/linux/man/man1/javac.1                       | 2381 +++++++++
 jdk17/linux/man/man1/javadoc.1                     | 1283 +++++
 jdk17/linux/man/man1/javap.1                       |  280 +
 jdk17/linux/man/man1/jcmd.1                        | 1112 ++++
 jdk17/linux/man/man1/jconsole.1                    |  102 +
 jdk17/linux/man/man1/jdb.1                         |  263 +
 jdk17/linux/man/man1/jdeprscan.1                   |  273 +
 jdk17/linux/man/man1/jdeps.1                       |  403 ++
 jdk17/linux/man/man1/jfr.1                         |  295 ++
 jdk17/linux/man/man1/jhsdb.1                       |  260 +
 jdk17/linux/man/man1/jinfo.1                       |  105 +
 jdk17/linux/man/man1/jlink.1                       |  434 ++
 jdk17/linux/man/man1/jmap.1                        |  101 +
 jdk17/linux/man/man1/jmod.1                        |  439 ++
 jdk17/linux/man/man1/jpackage.1                    |  525 ++
 jdk17/linux/man/man1/jps.1                         |  233 +
 jdk17/linux/man/man1/jrunscript.1                  |  175 +
 jdk17/linux/man/man1/jshell.1                      | 1449 +++++
 jdk17/linux/man/man1/jstack.1                      |   83 +
 jdk17/linux/man/man1/jstat.1                       |  702 +++
 jdk17/linux/man/man1/jstatd.1                      |  217 +
 jdk17/linux/man/man1/keytool.1                     | 2965 +++++++++++
 jdk17/linux/man/man1/rmiregistry.1                 |   92 +
 jdk17/linux/man/man1/serialver.1                   |   84 +
 jdk17/linux/release                                |   22 +-
 jdk8/linux/ASSEMBLY_EXCEPTION                      |   27 -
 jdk8/linux/COPYRIGHT                               |   69 +
 jdk8/linux/LICENSE                                 |  520 +-
 jdk8/linux/README.html                             |    9 +
 jdk8/linux/THIRDPARTYLICENSEREADME.txt             |    3 +
 jdk8/linux/THIRD_PARTY_README                      | 3139 -----------
 jdk8/linux/bin/appletviewer                        |  Bin 9156 -> 70616 bytes
 jdk8/linux/bin/clhsdb                              |  Bin 9172 -> 0 bytes
 jdk8/linux/bin/extcheck                            |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/hsdb                                |  Bin 9164 -> 0 bytes
 jdk8/linux/bin/idlj                                |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jar                                 |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jarsigner                           |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/java                                |  Bin 9029 -> 70472 bytes
 jdk8/linux/bin/java-rmi.cgi                        |   42 +-
 jdk8/linux/bin/javac                               |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/javadoc                             |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/javah                               |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/javap                               |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jcmd                                |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jconsole                            |  Bin 9180 -> 70624 bytes
 jdk8/linux/bin/jdb                                 |  Bin 9164 -> 70616 bytes
 jdk8/linux/bin/jdeps                               |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jhat                                |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jinfo                               |  Bin 9196 -> 70632 bytes
 jdk8/linux/bin/jjs                                 |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jmap                                |  Bin 9196 -> 70632 bytes
 jdk8/linux/bin/jps                                 |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jrunscript                          |  Bin 9156 -> 70616 bytes
 jdk8/linux/bin/jsadebugd                           |  Bin 9172 -> 70616 bytes
 jdk8/linux/bin/jstack                              |  Bin 9204 -> 70632 bytes
 jdk8/linux/bin/jstat                               |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/jstatd                              |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/keytool                             |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/native2ascii                        |  Bin 9156 -> 70616 bytes
 jdk8/linux/bin/orbd                                |  Bin 9204 -> 70632 bytes
 jdk8/linux/bin/pack200                             |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/policytool                          |  Bin 9156 -> 70616 bytes
 jdk8/linux/bin/rmic                                |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/rmid                                |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/rmiregistry                         |  Bin 9156 -> 70616 bytes
 jdk8/linux/bin/schemagen                           |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/serialver                           |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/servertool                          |  Bin 9156 -> 70616 bytes
 jdk8/linux/bin/tnameserv                           |  Bin 9212 -> 70632 bytes
 jdk8/linux/bin/unpack200                           |  Bin 187384 -> 221352 bytes
 jdk8/linux/bin/wsgen                               |  Bin 9148 -> 70608 bytes
 jdk8/linux/bin/wsimport                            |  Bin 9156 -> 70608 bytes
 jdk8/linux/bin/xjc                                 |  Bin 9148 -> 70608 bytes
 jdk8/linux/include/classfile_constants.h           |   34 +-
 jdk8/linux/include/jawt.h                          |   42 +-
 jdk8/linux/include/jdwpTransport.h                 |   34 +-
 jdk8/linux/include/jni.h                           |   34 +-
 jdk8/linux/include/jvmti.h                         |   34 +-
 jdk8/linux/include/jvmticmlr.h                     |   42 +-
 jdk8/linux/include/linux/jawt_md.h                 |   42 +-
 jdk8/linux/include/linux/jni_md.h                  |   42 +-
 jdk8/linux/jre/ASSEMBLY_EXCEPTION                  |   27 -
 jdk8/linux/jre/COPYRIGHT                           |   69 +
 jdk8/linux/jre/LICENSE                             |  520 +-
 jdk8/linux/jre/README                              |    1 +
 jdk8/linux/jre/THIRDPARTYLICENSEREADME.txt         |    3 +
 jdk8/linux/jre/THIRD_PARTY_README                  | 3139 -----------
 jdk8/linux/jre/Welcome.html                        |   28 +
 jdk8/linux/jre/bin/java                            |  Bin 9029 -> 70472 bytes
 jdk8/linux/jre/bin/jjs                             |  Bin 9148 -> 70608 bytes
 jdk8/linux/jre/bin/keytool                         |  Bin 9156 -> 70608 bytes
 jdk8/linux/jre/bin/orbd                            |  Bin 9204 -> 70632 bytes
 jdk8/linux/jre/bin/pack200                         |  Bin 9156 -> 70608 bytes
 jdk8/linux/jre/bin/policytool                      |  Bin 9156 -> 70616 bytes
 jdk8/linux/jre/bin/rmid                            |  Bin 9148 -> 70608 bytes
 jdk8/linux/jre/bin/rmiregistry                     |  Bin 9156 -> 70616 bytes
 jdk8/linux/jre/bin/servertool                      |  Bin 9156 -> 70616 bytes
 jdk8/linux/jre/bin/tnameserv                       |  Bin 9212 -> 70632 bytes
 jdk8/linux/jre/bin/unpack200                       |  Bin 187384 -> 221352 bytes
 jdk8/linux/jre/legal/jdk/asm.md                    |   36 +
 jdk8/linux/jre/legal/jdk/bcel.md                   |  219 +
 jdk8/linux/jre/legal/jdk/cldr.md                   |   63 +
 jdk8/linux/jre/legal/jdk/colorimaging.md           |    7 +
 jdk8/linux/jre/legal/jdk/cryptix.md                |   35 +
 jdk8/linux/jre/legal/jdk/dom.md                    |   77 +
 jdk8/linux/jre/legal/jdk/dynalink.md               |   32 +
 jdk8/linux/jre/legal/jdk/ecc.md                    |  581 ++
 jdk8/linux/jre/legal/jdk/freebxml.md               |   73 +
 jdk8/linux/jre/legal/jdk/giflib.md                 |   50 +
 jdk8/linux/jre/legal/jdk/icu.md                    |   66 +
 jdk8/linux/jre/legal/jdk/jcup.md                   |   30 +
 jdk8/linux/jre/legal/jdk/joni.md                   |   27 +
 jdk8/linux/jre/legal/jdk/jopt-simple.md            |   27 +
 jdk8/linux/jre/legal/jdk/jpeg.md                   |   83 +
 jdk8/linux/jre/legal/jdk/lcms.md                   |  103 +
 jdk8/linux/jre/legal/jdk/libpng.md                 |  215 +
 jdk8/linux/jre/legal/jdk/libxrandr.md              |   74 +
 jdk8/linux/jre/legal/jdk/mesa3d.md                 |  134 +
 jdk8/linux/jre/legal/jdk/pcsclite.md               |   57 +
 jdk8/linux/jre/legal/jdk/pipewire.md               |   41 +
 jdk8/linux/jre/legal/jdk/pkcs11cryptotoken.md      |   77 +
 jdk8/linux/jre/legal/jdk/pkcs11wrapper.md          |   46 +
 jdk8/linux/jre/legal/jdk/relaxngcc.md              |   48 +
 jdk8/linux/jre/legal/jdk/relaxngdatatype.md        |   37 +
 jdk8/linux/jre/legal/jdk/relaxngom.md              |   24 +
 jdk8/linux/jre/legal/jdk/santuario.md              |  227 +
 jdk8/linux/jre/legal/jdk/siphash.md                |  150 +
 jdk8/linux/jre/legal/jdk/thaidict.md               |   31 +
 jdk8/linux/jre/legal/jdk/unicode.md                |   53 +
 jdk8/linux/jre/legal/jdk/xalan.md                  |  234 +
 jdk8/linux/jre/legal/jdk/xerces.md                 |  229 +
 jdk8/linux/jre/legal/jdk/xmlresolver.md            |  224 +
 jdk8/linux/jre/legal/jdk/xorgproto.md              | 1316 +++++
 jdk8/linux/jre/legal/jdk/xwd.md                    |   34 +
 jdk8/linux/jre/legal/jdk/zlib.md                   |   27 +
 jdk8/linux/jre/lib/aarch64/jli/libjli.so           |  Bin 0 -> 145992 bytes
 jdk8/linux/jre/lib/aarch64/jvm.cfg                 |    5 +
 jdk8/linux/jre/lib/aarch64/libattach.so            |  Bin 0 -> 72248 bytes
 jdk8/linux/jre/lib/aarch64/libawt.so               |  Bin 0 -> 767000 bytes
 jdk8/linux/jre/lib/aarch64/libawt_headless.so      |  Bin 0 -> 76592 bytes
 jdk8/linux/jre/lib/aarch64/libawt_xawt.so          |  Bin 0 -> 632512 bytes
 jdk8/linux/jre/lib/aarch64/libbci.so               |  Bin 0 -> 70384 bytes
 jdk8/linux/jre/lib/aarch64/libdcpr.so              |  Bin 0 -> 230472 bytes
 jdk8/linux/jre/lib/aarch64/libdt_socket.so         |  Bin 0 -> 73544 bytes
 jdk8/linux/jre/lib/aarch64/libfontmanager.so       |  Bin 0 -> 503280 bytes
 jdk8/linux/jre/lib/aarch64/libhprof.so             |  Bin 0 -> 224760 bytes
 jdk8/linux/jre/lib/aarch64/libinstrument.so        |  Bin 0 -> 76576 bytes
 jdk8/linux/jre/lib/aarch64/libj2gss.so             |  Bin 0 -> 76808 bytes
 jdk8/linux/jre/lib/aarch64/libj2pcsc.so            |  Bin 0 -> 71784 bytes
 jdk8/linux/jre/lib/aarch64/libj2pkcs11.so          |  Bin 0 -> 146712 bytes
 jdk8/linux/jre/lib/aarch64/libjaas_unix.so         |  Bin 0 -> 69992 bytes
 jdk8/linux/jre/lib/aarch64/libjava.so              |  Bin 0 -> 245936 bytes
 jdk8/linux/jre/lib/aarch64/libjava_crw_demo.so     |  Bin 0 -> 71216 bytes
 jdk8/linux/jre/lib/aarch64/libjawt.so              |  Bin 0 -> 69832 bytes
 jdk8/linux/jre/lib/aarch64/libjdwp.so              |  Bin 0 -> 298032 bytes
 jdk8/linux/jre/lib/aarch64/libjfr.so               |  Bin 0 -> 73632 bytes
 jdk8/linux/jre/lib/aarch64/libjpeg.so              |  Bin 0 -> 286192 bytes
 jdk8/linux/jre/lib/aarch64/libjsdt.so              |  Bin 0 -> 70552 bytes
 jdk8/linux/jre/lib/aarch64/libjsig.so              |  Bin 0 -> 71016 bytes
 jdk8/linux/jre/lib/aarch64/libjsound.so            |  Bin 0 -> 70136 bytes
 jdk8/linux/jre/lib/aarch64/libjsoundalsa.so        |  Bin 0 -> 86944 bytes
 jdk8/linux/jre/lib/aarch64/liblcms.so              |  Bin 0 -> 590496 bytes
 jdk8/linux/jre/lib/aarch64/libmanagement.so        |  Bin 0 -> 81192 bytes
 jdk8/linux/jre/lib/aarch64/libmlib_image.so        |  Bin 0 -> 1005872 bytes
 jdk8/linux/jre/lib/aarch64/libnet.so               |  Bin 0 -> 154352 bytes
 jdk8/linux/jre/lib/aarch64/libnio.so               |  Bin 0 -> 155448 bytes
 jdk8/linux/jre/lib/aarch64/libnpt.so               |  Bin 0 -> 71064 bytes
 jdk8/linux/jre/lib/aarch64/libresource.so          |  Bin 0 -> 71152 bytes
 jdk8/linux/jre/lib/aarch64/libsaproc.so            |  Bin 0 -> 77696 bytes
 jdk8/linux/jre/lib/aarch64/libsctp.so              |  Bin 0 -> 74544 bytes
 jdk8/linux/jre/lib/aarch64/libsplashscreen.so      |  Bin 0 -> 444152 bytes
 jdk8/linux/jre/lib/aarch64/libsunec.so             |  Bin 0 -> 304912 bytes
 jdk8/linux/jre/lib/aarch64/libt2k.so               |  Bin 0 -> 502520 bytes
 jdk8/linux/jre/lib/aarch64/libunpack.so            |  Bin 0 -> 231600 bytes
 jdk8/linux/jre/lib/aarch64/libverify.so            |  Bin 0 -> 73840 bytes
 jdk8/linux/jre/lib/aarch64/libzip.so               |  Bin 0 -> 148208 bytes
 .../jre/lib/{amd64 => aarch64}/server/Xusage.txt   |    0
 .../jre/lib/{amd64 => aarch64}/server/libjsig.so   |    0
 .../jre/lib/{amd64 => aarch64}/server/libjvm.so    |  Bin 16448687 -> 16118064 bytes
 jdk8/linux/jre/lib/amd64/jli/libjli.so             |  Bin 112555 -> 0 bytes
 jdk8/linux/jre/lib/amd64/jvm.cfg                   |   35 -
 jdk8/linux/jre/lib/amd64/libattach.so              |  Bin 19443 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libawt.so                 |  Bin 795038 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libawt_headless.so        |  Bin 41708 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libawt_xawt.so            |  Bin 520149 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libdt_socket.so           |  Bin 25305 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libfontmanager.so         |  Bin 1071820 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libhprof.so               |  Bin 189654 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libinstrument.so          |  Bin 55655 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libj2gss.so               |  Bin 52526 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libj2pcsc.so              |  Bin 19060 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libj2pkcs11.so            |  Bin 91818 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjaas_unix.so           |  Bin 8814 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjava.so                |  Bin 217386 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjava_crw_demo.so       |  Bin 27372 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjawt.so                |  Bin 8434 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjdwp.so                |  Bin 302195 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjpeg.so                |  Bin 240952 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjsdt.so                |  Bin 13787 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjsig.so                |  Bin 13528 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjsound.so              |  Bin 8717 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libjsoundalsa.so          |  Bin 83863 -> 0 bytes
 jdk8/linux/jre/lib/amd64/liblcms.so                |  Bin 468623 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libmanagement.so          |  Bin 49304 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libmlib_image.so          |  Bin 895958 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libnet.so                 |  Bin 125629 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libnio.so                 |  Bin 97035 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libnpt.so                 |  Bin 18140 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libsaproc.so              |  Bin 56387 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libsctp.so                |  Bin 30804 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libsplashscreen.so        |  Bin 457109 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libsunec.so               |  Bin 265998 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libunpack.so              |  Bin 174605 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libverify.so              |  Bin 68689 -> 0 bytes
 jdk8/linux/jre/lib/amd64/libzip.so                 |  Bin 129511 -> 0 bytes
 jdk8/linux/jre/lib/calendars.properties            |   42 +-
 jdk8/linux/jre/lib/charsets.jar                    |  Bin 3135616 -> 3138663 bytes
 jdk8/linux/jre/lib/cmm/CIEXYZ.pf                   |  Bin 784 -> 51236 bytes
 jdk8/linux/jre/lib/cmm/GRAY.pf                     |  Bin 556 -> 632 bytes
 jdk8/linux/jre/lib/cmm/LINEAR_RGB.pf               |  Bin 488 -> 1044 bytes
 jdk8/linux/jre/lib/cmm/PYCC.pf                     |  Bin 234080 -> 274474 bytes
 jdk8/linux/jre/lib/cmm/sRGB.pf                     |  Bin 6876 -> 3144 bytes
 jdk8/linux/jre/lib/currency.data                   |  Bin 4102 -> 4162 bytes
 jdk8/linux/jre/lib/ext/cldrdata.jar                |  Bin 3861294 -> 3861927 bytes
 jdk8/linux/jre/lib/ext/dnsns.jar                   |  Bin 8293 -> 8488 bytes
 jdk8/linux/jre/lib/ext/jaccess.jar                 |  Bin 44523 -> 44517 bytes
 jdk8/linux/jre/lib/ext/localedata.jar              |  Bin 1179256 -> 1179690 bytes
 jdk8/linux/jre/lib/ext/meta-index                  |   16 +-
 jdk8/linux/jre/lib/ext/nashorn.jar                 |  Bin 2033800 -> 2035092 bytes
 jdk8/linux/jre/lib/ext/sunec.jar                   |  Bin 56258 -> 47589 bytes
 jdk8/linux/jre/lib/ext/sunjce_provider.jar         |  Bin 269837 -> 298030 bytes
 jdk8/linux/jre/lib/ext/sunpkcs11.jar               |  Bin 250331 -> 295726 bytes
 jdk8/linux/jre/lib/ext/zipfs.jar                   |  Bin 68986 -> 70319 bytes
 jdk8/linux/jre/lib/fontconfig.RedHat.5.bfc         |  Bin 0 -> 4532 bytes
 .../jre/lib/fontconfig.RedHat.5.properties.src     |  134 +
 jdk8/linux/jre/lib/fontconfig.RedHat.6.bfc         |  Bin 0 -> 4250 bytes
 .../jre/lib/fontconfig.RedHat.6.properties.src     |  134 +
 jdk8/linux/jre/lib/fontconfig.SuSE.10.bfc          |  Bin 0 -> 6702 bytes
 .../jre/lib/fontconfig.SuSE.10.properties.src      |  218 +
 jdk8/linux/jre/lib/fontconfig.SuSE.11.bfc          |  Bin 0 -> 7032 bytes
 .../jre/lib/fontconfig.SuSE.11.properties.src      |  227 +
 jdk8/linux/jre/lib/fontconfig.Turbo.bfc            |  Bin 0 -> 4668 bytes
 jdk8/linux/jre/lib/fontconfig.Turbo.properties.src |  144 +
 jdk8/linux/jre/lib/fontconfig.bfc                  |  Bin 1630 -> 1678 bytes
 jdk8/linux/jre/lib/fontconfig.properties.src       |   44 +-
 jdk8/linux/jre/lib/fonts/DroidSans-Bold.ttf        |  Bin 194488 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSans.ttf             |  Bin 190776 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSansFallbackFull.ttf |  Bin 4529044 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSansMono.ttf         |  Bin 119380 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSansMonoDotted.ttf   |  Bin 117696 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSansMonoSlashed.ttf  |  Bin 117744 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSerif-Bold.ttf       |  Bin 185228 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSerif-BoldItalic.ttf |  Bin 190304 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSerif-Italic.ttf     |  Bin 177560 -> 0 bytes
 jdk8/linux/jre/lib/fonts/DroidSerif-Regular.ttf    |  Bin 172916 -> 0 bytes
 jdk8/linux/jre/lib/fonts/FiraCode-Bold.ttf         |  Bin 260532 -> 0 bytes
 jdk8/linux/jre/lib/fonts/FiraCode-Light.ttf        |  Bin 228580 -> 0 bytes
 jdk8/linux/jre/lib/fonts/FiraCode-Medium.ttf       |  Bin 226100 -> 0 bytes
 jdk8/linux/jre/lib/fonts/FiraCode-Regular.ttf      |  Bin 227848 -> 0 bytes
 jdk8/linux/jre/lib/fonts/FiraCode-Retina.ttf       |  Bin 228788 -> 0 bytes
 jdk8/linux/jre/lib/fonts/Inconsolata.ttf           |  Bin 22416 -> 0 bytes
 jdk8/linux/jre/lib/fonts/LICENSE.txt               |   13 -
 jdk8/linux/jre/lib/fonts/LucidaBrightDemiBold.ttf  |  Bin 0 -> 75144 bytes
 .../linux/jre/lib/fonts/LucidaBrightDemiItalic.ttf |  Bin 0 -> 75124 bytes
 jdk8/linux/jre/lib/fonts/LucidaBrightItalic.ttf    |  Bin 0 -> 80856 bytes
 jdk8/linux/jre/lib/fonts/LucidaBrightRegular.ttf   |  Bin 0 -> 344908 bytes
 jdk8/linux/jre/lib/fonts/LucidaSansDemiBold.ttf    |  Bin 0 -> 317896 bytes
 jdk8/linux/jre/lib/fonts/LucidaSansRegular.ttf     |  Bin 0 -> 698236 bytes
 jdk8/linux/jre/lib/fonts/LucidaTypewriterBold.ttf  |  Bin 0 -> 234068 bytes
 .../jre/lib/fonts/LucidaTypewriterRegular.ttf      |  Bin 0 -> 242700 bytes
 jdk8/linux/jre/lib/fonts/Roboto-Light.ttf          |  Bin 140276 -> 0 bytes
 jdk8/linux/jre/lib/fonts/Roboto-Thin.ttf           |  Bin 130044 -> 0 bytes
 jdk8/linux/jre/lib/fonts/SourceCodePro-Bold.ttf    |  Bin 197004 -> 0 bytes
 jdk8/linux/jre/lib/fonts/SourceCodePro-BoldIt.ttf  |  Bin 162976 -> 0 bytes
 jdk8/linux/jre/lib/fonts/SourceCodePro-It.ttf      |  Bin 163624 -> 0 bytes
 jdk8/linux/jre/lib/fonts/SourceCodePro-Regular.ttf |  Bin 197644 -> 0 bytes
 jdk8/linux/jre/lib/fonts/font.conf                 |   22 -
 jdk8/linux/jre/lib/fonts/fonts.dir                 |  443 +-
 .../jre/lib/hijrah-config-umalqura.properties      |   34 +-
 jdk8/linux/jre/lib/jce.jar                         |  Bin 96663 -> 123084 bytes
 jdk8/linux/jre/lib/jexec                           |  Bin 22567 -> 71160 bytes
 jdk8/linux/jre/lib/jfr.jar                         |  Bin 0 -> 583587 bytes
 jdk8/linux/jre/lib/jfr/default.jfc                 |  596 +++
 jdk8/linux/jre/lib/jfr/profile.jfc                 |  596 +++
 jdk8/linux/jre/lib/jsse.jar                        |  Bin 684882 -> 1939575 bytes
 jdk8/linux/jre/lib/management-agent.jar            |  Bin 386 -> 382 bytes
 jdk8/linux/jre/lib/meta-index                      |  115 +-
 jdk8/linux/jre/lib/net.properties                  |   17 +
 .../lib/oblique-fonts/LucidaSansDemiOblique.ttf    |  Bin 0 -> 91352 bytes
 .../jre/lib/oblique-fonts/LucidaSansOblique.ttf    |  Bin 0 -> 253724 bytes
 .../oblique-fonts/LucidaTypewriterBoldOblique.ttf  |  Bin 0 -> 63168 bytes
 .../lib/oblique-fonts/LucidaTypewriterOblique.ttf  |  Bin 0 -> 137484 bytes
 jdk8/linux/jre/lib/oblique-fonts/fonts.dir         |   25 +
 jdk8/linux/jre/lib/psfont.properties.ja            |   42 +-
 jdk8/linux/jre/lib/psfontj2d.properties            |   42 +-
 jdk8/linux/jre/lib/resources.jar                   |  Bin 3502102 -> 3561021 bytes
 jdk8/linux/jre/lib/rt.jar                          |  Bin 65739697 -> 67926938 bytes
 jdk8/linux/jre/lib/security/blacklist              |   95 +
 jdk8/linux/jre/lib/security/blacklisted.certs      |   59 +-
 jdk8/linux/jre/lib/security/cacerts                |  Bin 103147 -> 128221 bytes
 jdk8/linux/jre/lib/security/java.policy            |    3 +-
 jdk8/linux/jre/lib/security/java.security          |  330 +-
 .../security/policy/limited/US_export_policy.jar   |  Bin 627 -> 7756 bytes
 .../lib/security/policy/limited/local_policy.jar   |  Bin 1047 -> 8250 bytes
 .../security/policy/unlimited/US_export_policy.jar |  Bin 627 -> 7756 bytes
 .../lib/security/policy/unlimited/local_policy.jar |  Bin 645 -> 7766 bytes
 jdk8/linux/jre/lib/security/trusted.libraries      |    0
 jdk8/linux/jre/lib/tzdb.dat                        |  Bin 107579 -> 101803 bytes
 jdk8/linux/legal/jdk/asm.md                        |   36 +
 jdk8/linux/legal/jdk/bcel.md                       |  219 +
 jdk8/linux/legal/jdk/cldr.md                       |   63 +
 jdk8/linux/legal/jdk/colorimaging.md               |    7 +
 jdk8/linux/legal/jdk/cryptix.md                    |   35 +
 jdk8/linux/legal/jdk/dom.md                        |   77 +
 jdk8/linux/legal/jdk/dynalink.md                   |   32 +
 jdk8/linux/legal/jdk/ecc.md                        |  581 ++
 jdk8/linux/legal/jdk/freebxml.md                   |   73 +
 jdk8/linux/legal/jdk/giflib.md                     |   50 +
 jdk8/linux/legal/jdk/icu.md                        |   66 +
 jdk8/linux/legal/jdk/jcup.md                       |   30 +
 jdk8/linux/legal/jdk/joni.md                       |   27 +
 jdk8/linux/legal/jdk/jopt-simple.md                |   27 +
 jdk8/linux/legal/jdk/jpeg.md                       |   83 +
 jdk8/linux/legal/jdk/lcms.md                       |  103 +
 jdk8/linux/legal/jdk/libpng.md                     |  215 +
 jdk8/linux/legal/jdk/libxrandr.md                  |   74 +
 jdk8/linux/legal/jdk/mesa3d.md                     |  134 +
 jdk8/linux/legal/jdk/pcsclite.md                   |   57 +
 jdk8/linux/legal/jdk/pipewire.md                   |   41 +
 jdk8/linux/legal/jdk/pkcs11cryptotoken.md          |   77 +
 jdk8/linux/legal/jdk/pkcs11wrapper.md              |   46 +
 jdk8/linux/legal/jdk/relaxngcc.md                  |   48 +
 jdk8/linux/legal/jdk/relaxngdatatype.md            |   37 +
 jdk8/linux/legal/jdk/relaxngom.md                  |   24 +
 jdk8/linux/legal/jdk/santuario.md                  |  227 +
 jdk8/linux/legal/jdk/siphash.md                    |  150 +
 jdk8/linux/legal/jdk/thaidict.md                   |   31 +
 jdk8/linux/legal/jdk/unicode.md                    |   53 +
 jdk8/linux/legal/jdk/xalan.md                      |  234 +
 jdk8/linux/legal/jdk/xerces.md                     |  229 +
 jdk8/linux/legal/jdk/xmlresolver.md                |  224 +
 jdk8/linux/legal/jdk/xorgproto.md                  | 1316 +++++
 jdk8/linux/legal/jdk/xwd.md                        |   34 +
 jdk8/linux/legal/jdk/zlib.md                       |   27 +
 jdk8/linux/lib/aarch64/jli/libjli.so               |  Bin 0 -> 146024 bytes
 jdk8/linux/lib/aarch64/libjawt.so                  |  Bin 0 -> 69344 bytes
 jdk8/linux/lib/amd64/jli/libjli.so                 |  Bin 401561 -> 0 bytes
 jdk8/linux/lib/amd64/libjawt.so                    |  Bin 28932 -> 0 bytes
 jdk8/linux/lib/ct.sym                              |  Bin 17848895 -> 18476445 bytes
 jdk8/linux/lib/dt.jar                              |  Bin 163088 -> 163067 bytes
 jdk8/linux/lib/ir.idl                              |   34 +-
 jdk8/linux/lib/jconsole.jar                        |  Bin 407748 -> 410525 bytes
 jdk8/linux/lib/jexec                               |  Bin 22567 -> 71160 bytes
 jdk8/linux/lib/orb.idl                             |   42 +-
 jdk8/linux/lib/sa-jdi.jar                          |  Bin 2286809 -> 2443085 bytes
 jdk8/linux/lib/tools.jar                           |  Bin 18339752 -> 18327438 bytes
 jdk8/linux/man/ja                                  |    1 +
 jdk8/linux/man/ja_JP.UTF-8/man1/appletviewer.1     |   88 +
 jdk8/linux/man/ja_JP.UTF-8/man1/extcheck.1         |   91 +
 jdk8/linux/man/ja_JP.UTF-8/man1/idlj.1             |  529 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/jar.1              |  519 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/jarsigner.1        | 1078 ++++
 jdk8/linux/man/ja_JP.UTF-8/man1/java.1             | 3117 +++++++++++
 jdk8/linux/man/ja_JP.UTF-8/man1/javac.1            | 1557 ++++++
 jdk8/linux/man/ja_JP.UTF-8/man1/javadoc.1          | 4657 ++++++++++++++++
 jdk8/linux/man/ja_JP.UTF-8/man1/javah.1            |  203 +
 jdk8/linux/man/ja_JP.UTF-8/man1/javap.1            |  348 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/javaws.1           |  215 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jcmd.1             |  139 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jconsole.1         |  139 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jdb.1              |  370 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/jdeps.1            |  375 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/jhat.1             |  197 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jinfo.1            |  169 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jjs.1              |  415 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/jmap.1             |  192 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jps.1              |  251 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jrunscript.1       |  194 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jsadebugd.1        |  155 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jstack.1           |  194 +
 jdk8/linux/man/ja_JP.UTF-8/man1/jstat.1            |  625 +++
 jdk8/linux/man/ja_JP.UTF-8/man1/jstatd.1           |  259 +
 jdk8/linux/man/ja_JP.UTF-8/man1/keytool.1          | 2229 ++++++++
 jdk8/linux/man/ja_JP.UTF-8/man1/native2ascii.1     |   81 +
 jdk8/linux/man/ja_JP.UTF-8/man1/orbd.1             |  266 +
 jdk8/linux/man/ja_JP.UTF-8/man1/pack200.1          |  354 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/policytool.1       |  158 +
 jdk8/linux/man/ja_JP.UTF-8/man1/rmic.1             |  338 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/rmid.1             |  354 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/rmiregistry.1      |  116 +
 jdk8/linux/man/ja_JP.UTF-8/man1/schemagen.1        |  142 +
 jdk8/linux/man/ja_JP.UTF-8/man1/serialver.1        |  129 +
 jdk8/linux/man/ja_JP.UTF-8/man1/servertool.1       |  182 +
 jdk8/linux/man/ja_JP.UTF-8/man1/tnameserv.1        |  427 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/unpack200.1        |  186 +
 jdk8/linux/man/ja_JP.UTF-8/man1/wsgen.1            |  215 +
 jdk8/linux/man/ja_JP.UTF-8/man1/wsimport.1         |  318 ++
 jdk8/linux/man/ja_JP.UTF-8/man1/xjc.1              |  325 ++
 jdk8/linux/man/man1/appletviewer.1                 |   69 +
 jdk8/linux/man/man1/extcheck.1                     |   70 +
 jdk8/linux/man/man1/idlj.1                         |  547 ++
 jdk8/linux/man/man1/jar.1                          |  464 ++
 jdk8/linux/man/man1/jarsigner.1                    |  788 +++
 jdk8/linux/man/man1/java.1                         | 4429 ++++++++++++++++
 jdk8/linux/man/man1/javac.1                        | 1349 +++++
 jdk8/linux/man/man1/javadoc.1                      | 2984 +++++++++++
 jdk8/linux/man/man1/javah.1                        |  138 +
 jdk8/linux/man/man1/javap.1                        |  372 ++
 jdk8/linux/man/man1/javaws.1                       |  157 +
 jdk8/linux/man/man1/jcmd.1                         |  216 +
 jdk8/linux/man/man1/jconsole.1                     |   92 +
 jdk8/linux/man/man1/jdb.1                          |  250 +
 jdk8/linux/man/man1/jdeps.1                        |  517 ++
 jdk8/linux/man/man1/jhat.1                         |  116 +
 jdk8/linux/man/man1/jinfo.1                        |  112 +
 jdk8/linux/man/man1/jjs.1                          |  228 +
 jdk8/linux/man/man1/jmap.1                         |  123 +
 jdk8/linux/man/man1/jps.1                          |  184 +
 jdk8/linux/man/man1/jrunscript.1                   |  175 +
 jdk8/linux/man/man1/jsadebugd.1                    |   88 +
 jdk8/linux/man/man1/jstack.1                       |  117 +
 jdk8/linux/man/man1/jstat.1                        |  758 +++
 jdk8/linux/man/man1/jstatd.1                       |  189 +
 jdk8/linux/man/man1/keytool.1                      | 1593 ++++++
 jdk8/linux/man/man1/native2ascii.1                 |   66 +
 jdk8/linux/man/man1/orbd.1                         |  193 +
 jdk8/linux/man/man1/pack200.1                      |  270 +
 jdk8/linux/man/man1/policytool.1                   |   94 +
 jdk8/linux/man/man1/rmic.1                         |  203 +
 jdk8/linux/man/man1/rmid.1                         |  294 +
 jdk8/linux/man/man1/rmiregistry.1                  |   78 +
 jdk8/linux/man/man1/schemagen.1                    |  101 +
 jdk8/linux/man/man1/serialver.1                    |   90 +
 jdk8/linux/man/man1/servertool.1                   |  117 +
 jdk8/linux/man/man1/tnameserv.1                    |  468 ++
 jdk8/linux/man/man1/unpack200.1                    |  117 +
 jdk8/linux/man/man1/wsgen.1                        |  155 +
 jdk8/linux/man/man1/wsimport.1                     |  196 +
 jdk8/linux/man/man1/xjc.1                          |  212 +
 jdk8/linux/release                                 |    9 +-
 jdk8/linux/src.zip                                 |  Bin 51372817 -> 21193159 bytes
 649 files changed, 75331 insertions(+), 8823 deletions(-)
