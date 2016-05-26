this.Projects = React.createClass({
  getInitialState: function() {
    return {
      projects: this.props.data
    };
  },

  getDefaultProps: function() {
    return { projects: [] };
  },

  updateProject: function(project, data) {
    index = this.state.projects.indexOf(project);
    projects = React.addons.update(this.state.projects, { $splice: [[index, 1, data]] });
    this.replaceState({ projects: projects });
  },

  addProject: function(project) {
    projects = this.state.projects.slice();
    projects.push(project);
    this.setState({projects: projects});
  },

  deleteProject: function(project) {
    index = this.state.projects.indexOf(project);
    projects = React.addons.update(this.state.projects, { $splice: [[index, 1]] });
    this.replaceState({ projects: projects });
  },

  render: function() {
    var el = this;
    var items = this.state.projects;

    return (
      <div className="projects">
        <ProjectForm handleNewProject={this.addProject} />
        {items.map(function(project, i) {
          return <Project project={project} key={i} handleDeleteProject={el.deleteProject} handleEditProject={el.updateProject} />
        })}
      </div>
    )
  }
})

// ============// ============//================//============

this.ProjectForm = React.createClass({
  getInitialState: function() {
    return { name: '', description: ''};
  },

  valid: function() {
    return this.state.name && this.state.description
  },

  handleChange: function(e) {
    var change = {};
    var targetName = e.target.name;
    change[targetName] = e.target.value;
    this.setState(change);
  },

  handleSubmit: function(e) {

    var request = $.ajax({
      method: 'POST',
      url: '/projects',
      dataType: 'JSON',
      data: {project: this.state}
    });

    request.done( (data) => {
      this.props.handleNewProject(data);
      this.setState(this.getInitialStat());
    });
  },

  render: function() {
    var curState = this.state;
    return (
      <form className='form-inline' onSubmit={this.handleSubmit}>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Name' name='name'
            value={curState.name} onChange={this.handleChange} />
        </div>
        <div className='form-group'>
          <input type='text' className='form-control' placeholder='Description' name='description'
            value={curState.description} onChange={this.handleChange} />
          <button type='submit' className='btn btn-primary' disabled={!this.valid()}>Add Project</button>
        </div>
      </form>
    )
  }
})

// ====================//====================//================//============

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








