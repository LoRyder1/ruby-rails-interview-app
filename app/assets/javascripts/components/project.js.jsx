this.Project = React.createClass({
  getInitialState: function() {
    return {edit: false }
  },

  handleToggle: function(e) {
    e.preventDefault();
    this.setState({edit: !this.state.edit })
  },

  handleDelete: function(e) {
    e.preventDefault();
    var request = $.ajax({
      method: 'DELETE',
      url: "/projects/" + this.props.project.id,
      dataType: 'JSON'
    });

    request.done( () => {
      this.props.handleDeleteProject(this.props.project)
    });
  },

  handleEdit: function(e) {
    e.preventDefault();

    var data = {
      name: ReactDOM.findDOMNode(this.refs.name).value,
      description: ReactDOM.findDOMNode(this.refs.description).value
    };

    var request = $.ajax({
      method: 'PUT',
      url: "/projects/" + this.props.project.id,
      dataType: 'JSON',
      data: { project: data }
    });

    request.done( (data) => {
      this.setState({ edit: false });
      this.props.handleEditProject(this.props.project, data);
    })
  },

  projectForm: function() {
    var propProject = this.props.project;

    return (

      <ul>
        <hr />
        <li>
          <input className="form-control" type="text" defaultValue={propProject.name} ref="name" />
        </li>
        <li>
          <input className="form-control" type="text" defaultValue={propProject.description} ref="description" />
        </li>
        <li>
          <a className="btn btn-default" onClick={this.handleEdit}>Update </a>
          <a className="btn btn-danger" onClick={this.handleToggle}>Cancel </a>
        </li>
      </ul>
    )
  },

  projectRow: function() {
    var propProject = this.props.project;

    return (
      <ul>
        <hr/>
        <li>
          <a href={"projects/" + propProject.id}>{propProject.name} </a>
        </li>
        <li>
          {propProject.description}
        </li>
        <li>
          <a className="btn btn-default" onClick={this.handleToggle}>Edit </a>
          <a className="btn btn-danger" onClick={this.handleDelete}>Delete </a>
        </li>
      </ul>
    )
  },

  render: function() {
    if (this.state.edit) {
      return this.projectForm();
    } else {
      return this.projectRow();
    }
  }
})
