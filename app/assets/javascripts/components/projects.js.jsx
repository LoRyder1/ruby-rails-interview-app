this.Projects = React.createClass({
  getInitialState: function() {
    return {
      projects: this.props.data
    };
  },

  addProject: function(project) {
    projects = this.state.projects.slice();
    projects.push(project);
    this.setState({projects: projects});
  },

  render: function() {
    var el = this;
    var items = this.state.projects;

    return (

      <div className="projects">

        <ProjectForm handleNewProject={this.addProject} />


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

