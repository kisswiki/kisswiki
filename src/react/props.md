It is okay to pass whatever props to your own ReactComponents (like <ChatBox msg=''/>, <Book rack='1'/>) but not to core DOM elements. May be not a solution in your case, but if you append 'data-' to the prop name like 'data-propname' React doesn't complain.

https://stackoverflow.com/questions/38175958/react-bootstrap-warnings-about-unknown-props/38275985#38275985
