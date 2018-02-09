#include "JSON.au3"
Global Const $HTTP_STATUS_OK = 200
Global $RPC = "https://api.steemit.com"

Func _Steem_Get_Config()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_config","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_State($path)
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_state","params":["'&$path&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Dynamic_Global_Properties()
Local $Data1='{"jsonrpc": "2.0", "method": "call", "params":["database_api","get_dynamic_global_properties"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Chain_Properties()
Local $Data1='{"jsonrpc": "2.0", "method": "get_chain_properties","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Current_Median_History_Price()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_current_median_history_price","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Feed_History()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_feed_history","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Witness_Schedule()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_witness_schedule","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Hardfork_Version()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_hardfork_version","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Next_Scheduled_Hardfork()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_next_scheduled_hardfork","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Account($name)
Local $Data1='{ "jsonrpc": "2.0", "method": "get_accounts", "params": [["'&$name&'"]], "id": 99}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Account_Count()
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_account_count","params":[]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Owner_History($name)
Local $Data1='{"jsonrpc": "2.0","id":23,"method":"get_owner_history","params":["'&$name&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Block_Header($blockNum)
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_block_header","params":["'&$blockNum&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Block($blocknumber)
Local $Data1='{"jsonrpc": "2.0","id":23,"method":"get_block","params":["'&$blocknumber&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Vesting_Delegations($account, $from, $limit)
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_vesting_delegations","params":["'&$account&'","'&$from&'","'&$limit&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Ops_In_Block($blockNum, $onlyVirtual)
Local $Data1='{"jsonrpc": "2.0","id":7,"method":"get_ops_in_block","params":["'&$blockNum&'","'&$onlyVirtual&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Content_Replies($name,$permalink)
Local $Data1='{"jsonrpc": "2.0","id":20,"method":"get_content_replies","params":["'&$name&'", "'&$permalink&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Active_Votes($name,$permalink)
Local $Data1='{"jsonrpc": "2.0","id":12,"method":"get_active_votes","params":[ "'&$name&'", "'&$permalink&'"]}'
Return HttpPost($Data1)
EndFunc

Func _Steem_Get_Content($name,$permalink)
Local $Data1='{"jsonrpc": "2.0","id":12,"method":"get_content","params":[ "'&$name&'", "'&$permalink&'"]}'
Return HttpPost($Data1)
EndFunc


Func HttpPost($sData = "")
Local $oHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")
$oHTTP.Open("POST", $RPC, False)
If (@error) Then Return SetError(1, 0, 0)
$oHTTP.SetRequestHeader("Content-Type", "application/json-rpc")
$oHTTP.Send($sData)
If (@error) Then Return SetError(2, 0, 0)
If ($oHTTP.Status <> $HTTP_STATUS_OK) Then Return SetError(3, 0, 0)
Return SetError(0, 0, $oHTTP.ResponseText)
EndFunc
