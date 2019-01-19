---
title: Creating a custom ebuild from a cabal package.
---

#### Do you Want to add a new haskell library to portage, but do not know how?  We are going to add Euterpea music library for haskell as an example.  
##### This guide does *not* use a custom overlay:
\

```bash
     $ mkdir -p ~/overlays/gentoo-haskell
     $ cd ~/overlays/gentoo-haskell
     $ sudo hackport -p ~/overlays/gentoo-haskell/ update
     $ sudo hackport -p /home/madjestic/overlays/gentoo-haskell/ make-ebuild dev-haskell ~/Projects/Haskell/Euterpea2/Euterpea.cabal
     $ sudo cp -R /home/madjestic/overlays/gentoo-haskell/dev-haskell/euterpea/ /usr/local/portage/dev-haskell/
     $ cd /usr/local/portage/dev-haskell/euterpea/
```
We are almost ready to generate a file manifest (that's what allows portage to see the new ebuild).  This step is not strictly necessary, but it tells Manifest file to use thin format.  Edit and past the following to `/usr/local/portage/metadata/layout.conf` (copied from gentoo-haskell):
```bash
masters = gentoo
cache-formats = md5-dict
thin-manifests = true
manifest-hashes = BLAKE2B SHA512
# too many ebuilds are using old EAPIs
#eapis-deprecated = 0 1 2 3 4
#let's start from smaller amount:
eapis-deprecated = 0 1 2 3
```
Next, we need to generate a manifest file.  There are 2 options:
```bash
     $ sudo ebuild ./euterpea-2.0.6.ebuild manifest
```
or
```bash
     $ sudo repoman manifest
```
(for more verbose output, you could run `sudo repoman full`)

*If you plan to submit the package to gentoo-haskell overlay, the previous step can be performed inside the package directory of the cloned github image of the project fork.*

Now we need to make the newly added ebuild visible to portage:
```bash
     $ sudo emerge --sync
     $ sudo emerge --search euterpea                                                  ```
     
Let's verify the setup:
```bash
     $ emerge --search euterpea
     [ Results for search key : euterpea ]
     Searching...
      
     *  dev-haskell/euterpea [ Masked ]
       Latest version available: 2.0.6
       Latest version installed: [ Not Installed ]
       Size of files: 11,387 KiB
       Homepage:      http://www.euterpea.com
       Description:   Library for computer music research and education
       License:       BSD
      
       [ Applications found : 1 ]
```
If all worked out as expected, now you can do
`$ emerga euterpea` in order to merge the ebuild.  
\


Happy hacking!
