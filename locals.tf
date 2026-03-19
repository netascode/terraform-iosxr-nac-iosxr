locals {
  dscp_map = {
    "0"  = "default", "8" = "cs1", "10" = "af11",
    "12" = "af12", "14" = "af13", "16" = "cs2",
    "18" = "af21", "20" = "af22", "22" = "af23",
    "24" = "cs3", "26" = "af31", "28" = "af32",
    "30" = "af33", "32" = "cs4", "34" = "af41",
    "36" = "af42", "38" = "af43", "40" = "cs5",
    "46" = "ef", "48" = "cs6", "56" = "cs7"
  }
  precedence_map = {
    "0" = "routine", "1" = "priority",
    "2" = "immediate", "3" = "flash",
    "4" = "flash-override", "5" = "critical",
    "6" = "internet", "7" = "network"
  }
  # Used by iosxr_key_chain to convert MM-DD-YYYY date format to YANG month enum
  keychain_month_names = {
    "01" = "january", "02" = "february", "03" = "march",
    "04" = "april", "05" = "may", "06" = "june",
    "07" = "july", "08" = "august", "09" = "september",
    "10" = "october", "11" = "november", "12" = "december"
  }
}
