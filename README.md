# Meeshkan GitHub action
A GitHub action to run HTTP based tests against a service.

NOTE: Early experiments at this stage.

# Usage
Add this build step:

```yaml
    - name: Run meeshkan tests
      id: meeshkan
      uses: meeshkan/action@master
      with:
        endpoint: 'http://localhost:8080'
```

# Resources
- [Metadata syntax for action.yml](https://help.github.com/en/actions/building-actions/metadata-syntax-for-github-actions)
- [Hello world for a docker action](https://github.com/actions/hello-world-docker-action)
- [Publishing actions](https://help.github.com/en/actions/building-actions/publishing-actions-in-github-marketplace)
