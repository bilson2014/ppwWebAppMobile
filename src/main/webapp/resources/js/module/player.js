define(function(){
	function Player(){
		this.name = 'Player';
		var yk_client_id="1177d7f227ca86b1";
	}
	
	Player.prototype = {
			makePlayer : function(a,b){
				var c="";b.indexOf("player.youku.com")>-1?c=b.split("/sid/")[1].split("/v.swf")[0]:b.indexOf("v.youku.com")>-1&&(c=b.split("http://v.youku.com/v_show/id_")[1].split(".html")[0]),player=new YKU.Player(a,{styleid:"6",client_id:yk_client_id,vid:c,show_related:!1})
			},
			destroyPlayer : function(a){
				document.getElementById(a).innerHTML="";
			}
	}
	
	return {
		Player : Player
	}
});