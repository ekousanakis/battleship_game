import socket from './socket'

(function(){

    let id = $('#id').data("id");

    if(!id)
        return;

    let channel = socket.channel("event:" + id, {});

    channel.on("update_winner", event=>{
        
        console.log("Update", event);
        $('h1').text(event.winner)
    })
    

    channel.join()
        .receive("ok", resp => {console.log("Joined successfully event:" + id, resp)})
        .receive("error", resp => {console.log("unable to join:", resp)})
})();

