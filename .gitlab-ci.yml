# Use a modern TeX Live image that also includes the 'make' utility.
variables:
  LATEX_IMAGE: listx/texlive:2024

# Define the stages for the pipeline: first build, then release.
stages:
  - build
  - release

# This job runs 'make all' and saves the resulting files as artifacts.
build_assets:
  stage: build
  image: $LATEX_IMAGE
  script:
    # We assume your Makefile's "all" target creates all the necessary files.
    - make all
  artifacts:
    # Define the specific files you want to keep and pass to the release job.
    paths:
      - build/unpacked/maine-thesis.cls
      - maine-thesis.tds.zip
      - "maine-thesis-*.zip"
      - template.zip
    # Expire artifacts after 1 week to save space.
    expire_in: 1 week
  # This job will run on all commits except tags.
  except:
    - tags

# This job creates a formal release and attaches the artifacts from the build job.
create_release:
  stage: release
  image: registry.gitlab.com/gitlab-org/release-cli:latest
  # This job depends on the 'build_assets' job to be successful.
  needs:
    - job: build_assets
      artifacts: true
  script:
    - echo "Creating release for tag $CI_COMMIT_TAG"
    # Construct the versioned filename by stripping the 'v' from the Git tag.
    - |
      VERSION="${CI_COMMIT_TAG#v}"
      VERSIONED_ZIP_FILENAME="maine-thesis-${VERSION}.zip"
    # The release-cli command uploads the files directly from the artifacts.
    # We use 'filepath' which is much simpler and more reliable than building a URL.
    - release-cli create --name "Release $CI_COMMIT_TAG" --tag-name $CI_COMMIT_TAG \
        --assets-link "{\"name\":\"maine-thesis.cls\", \"filepath\":\"build/unpacked/maine-thesis.cls\"}" \
        --assets-link "{\"name\":\"maine-thesis.tds.zip\", \"filepath\":\"maine-thesis.tds.zip\"}" \
        --assets-link "{\"name\":\"maine-thesis-template.zip\", \"filepath\":\"template.zip\"}" \
        --assets-link "{\"name\":\"${VERSIONED_ZIP_FILENAME}\", \"filepath\":\"${VERSIONED_ZIP_FILENAME}\"}"
  # This rule ensures the release job ONLY runs when a new Git tag is pushed.
  rules:
    - if: $CI_COMMIT_TAG