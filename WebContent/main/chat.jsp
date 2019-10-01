<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="/DotNet/css/bootstrap.css">

</head>
<body>

	<div id="like_button_container"></div>
	<script type="text/javascript" src="/DotNet/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="/DotNet/js/bootstrap.bundle.js"></script>
	<script src="https://unpkg.com/react@16/umd/react.development.js"
		crossorigin></script>
	<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
	<script
		src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"
		crossorigin></script>
	<div id="root"></div>

	<script type="text/babel">
const e = <div id='root'></div>
class Counter extends React.Component {
	state = {
			number : 0
	}
	handleIncrease = () => {
		const { number } = this.state;
		this.setState({
			number: number + 1
		})
	}
	handleDecrease = ()=>{
		this.setState(
				({number})=>({
					number : number - 1
				})
		)
	}
	render(){
const arr = ["1.jpg","조인성.jpg"]
		return (
				<div className="container">
					<div>val >> {this.state.number} </div>
					<button className="btn primary" onClick={this.handleIncrease}>+</button>
					
					<button className="btn danger" onClick={this.handleDecrease}>-</button>
					
<div><img src="/DotNet/save/{arr[number % 2]}"/></div>
				</div>
		)
	}
}
ReactDOM.render(<Counter />, document.getElementById('root'));
</script>

</body>
</html>