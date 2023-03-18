#!/bin/bash
PLATFORM="linux/amd64"
IMAGE_REPOSITORY=$1

get_image_size () {
  # The byte size parsing is based on the OCI Image Manifest Specification at https://specs.opencontainers.org/image-spec/manifest/
  local bytes="$(crane manifest $1:$2 --platform $3 \
    | jq '.config.size + ([.layers[].size] | add)')"
  echo $bytes
}

get_repository_image_tags () {
  echo "$(crane ls $1)"
}

get_repository_size () {
  repository_bytes=0
  while read -r image_tag ; do
    image_bytes=$(get_image_size $1 ${image_tag} $2)
    let "repository_bytes+=image_bytes"
  done <<< "$image_tags"
  echo $repository_bytes
}

start=`date +%s`

image_tags="$(get_repository_image_tags ${IMAGE_REPOSITORY})"
number_of_image_tags="$(wc -l <<< "$image_tags")"
echo "Fetching total size for ${number_of_image_tags} tagged images in the repository ${IMAGE_REPOSITORY}"
repository_bytes=$(get_repository_size ${IMAGE_REPOSITORY} ${PLATFORM})
repository_size=$(numfmt --to=iec $repository_bytes)
echo "Repository ${IMAGE_REPOSITORY} has a total size of ${repository_size} (${repository_bytes} bytes)"

end=`date +%s`
runtime=$((end-start))
hours=$((runtime / 3600)); minutes=$(( (runtime % 3600) / 60 )); seconds=$(( (runtime % 3600) % 60 ));
echo "Fetching total size of ${number_of_image_tags} tagged images in the repository ${IMAGE_REPOSITORY} took ${hours}h ${minutes}m ${seconds}s"