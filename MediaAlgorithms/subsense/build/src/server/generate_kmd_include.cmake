  execute_process (COMMAND /usr/bin/kurento-module-creator -r /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/subsense/src/server/interface ;-dr;/usr/share/kurento/modules -o /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/subsense/build/src/server/)

  file (READ /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/subsense/build/src/server/subsense.kmd.json KMD_DATA)

  string (REGEX REPLACE "\n *" "" KMD_DATA ${KMD_DATA})
  string (REPLACE "\"" "\\\"" KMD_DATA ${KMD_DATA})
  string (REPLACE "\\n" "\\\\n" KMD_DATA ${KMD_DATA})
  set (KMD_DATA "\"${KMD_DATA}\"")

  file (WRITE /home/viva22017/SmartSecurityApp/kurento/MediaAlgorithms/subsense/build/src/server/subsense.kmd.json ${KMD_DATA})