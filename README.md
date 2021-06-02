# Meeshkan GitHub Action

> A GitHub action to run Meeshkan tests from your CI pipeline.

## Usage

Add this build step:

```yaml
  - name: Run Meeshkan tests
    uses: meeshkan/action@master
    with:
      client_id: 'ck08eum6101qf01l9cn6v35v4'
      client_secret: ${{ secrets.MEESHKAN_CLIENT_SECRET }}
      url: $URL_TO_TEST_AGAINST
```

## Resources

- [Metadata syntax for action.yml](https://help.github.com/en/actions/building-actions/metadata-syntax-for-github-actions)
- [Hello world for a docker action](https://github.com/actions/hello-world-docker-action)
- [Publishing actions](https://help.github.com/en/actions/building-actions/publishing-actions-in-github-marketplace)
