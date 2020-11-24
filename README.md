# Meeshkan GitHub action
A GitHub action to run HTTP based tests against a service.

# Usage
Add this build step:

```yaml
    - name: Run meeshkan tests
      uses: meeshkan/action@master
      with:
        client_id: '204d89a3-8d0b-4223-83fe-efcbd6d41e16'
        client_secret: ${{ secrets.MEESHKAN_CLIENT_SECRET }}
        url: $URL_TO_TEST_AGAINST
```

# Resources
- [Metadata syntax for action.yml](https://help.github.com/en/actions/building-actions/metadata-syntax-for-github-actions)
- [Hello world for a docker action](https://github.com/actions/hello-world-docker-action)
- [Publishing actions](https://help.github.com/en/actions/building-actions/publishing-actions-in-github-marketplace)
