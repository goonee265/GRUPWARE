package mybatis;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/weball")
public class WebSocketServer {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws Exception {
		System.out.println(message);
		synchronized (clients) {
			String movemessage = session.getId() + " : " + message;
			forEach(session, movemessage);
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		clients.add(session);
		
		forEach(session, "#"+clients.size());
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
		
		forEach(session, "#"+clients.size());
	}

	public void forEach(Session session, String message)  {
		for (Session client : clients) {
			if (!client.equals(session)||message.startsWith("#")) {
					try {
						client.getBasicRemote().sendText(message);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}


}