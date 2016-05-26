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
