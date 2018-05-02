<h1>Create a new Owner</h1>

<form action="/pets" method="POST">
  <label>Name:</label>

  <br></br>

  <input type="text" name="pet[name]" id="pet_name">

  <br></br>

  <%Owner.all.each do |owner|%>
    <input type="checkbox" name="pet[owner_id]" id="<%= owner.id %>" value="<%=owner.id%>"><%=owner.name%></input>
  <%end%>

  <br></br>
    <label>Name:</label>
      <input  type="text" name="owner[name]" id="owner_name"></input>
    <br></br>

  <input type="submit" value="Create Pet">
</form>
