<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}


</style>

<ul>
  <li><a href="Index.jsp">Home</a></li>
  <li><a href="http://www.nyan.cat/original">Click me</a></li>
  <li style="float:right"><a class="active" href="#about">About</a></li>
</ul>

